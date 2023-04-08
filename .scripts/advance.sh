#!/usr/bin/env bash

# This script refreshes hints and the F* snapshot, and updates the
# version number from version.txt and opam

set -e
set -x

# Update the version number in version.txt and fstar.opam

function update_version_number () {
    # version suffix string
    local dev='~dev'

    # Read the latest version number
    last_version_number=$(sed 's!'"$dev"'!!' < version.txt)

    # If the only diffs are the snapshot hints and/or CI scripts,
    # then we don't need to
    # update the version number.  This check will fail if the version
    # number does not correspond to any existing release.  This is
    # sound, since if the version number is not a tag, it means that
    # it has already been updated since the latest release, so there
    # were more than just *.hints diffs, so we can update the version
    # number again.  Please mind the initial 'v' introducing the
    # version tag
    if git diff --exit-code v$last_version_number..HEAD -- ':(exclude)*.hints' ':(exclude).docker' ':(exclude).ci' ':(exclude).scripts' ; then
	echo "No diffs since latest release other than hints and/or CI scripts"
	return 0
    fi

    # Create a new version number.  Fail if it is identical to the
    # last version number. In other words, this task should be run at
    # most once a day.
    this_date=$(date '+%Y.%m.%d')
    version_number="$this_date""$dev"
    [[ $version_number != $last_version_number ]]

    # Update it in version.txt
    echo $version_number > version.txt

    # Update it in fstar.opam
    sed -i 's!^version:.*$!version: "'$version_number'"!' fstar.opam

    # Commit the new version number. This is guaranteed to be a
    # nonempty change, since version numbers were tested to be
    # different
    git add -u version.txt fstar.opam
    git commit -m "[CI] bump version number to $version_number"
}

function git_add_fstar_snapshot () {
    if ! git diff-index --quiet --cached HEAD -- ocaml/*/generated ; then
        git ls-files ocaml/*/generated | xargs git add
    fi
}

# Is this branch protected?
function is_protected_branch () {
    [[ "$CI_BRANCH" = master || "$CI_BRANCH" = _release ]]
}

# Note: this performs an _approximate_ refresh of the hints, in the sense that
# since the hint refreshing job takes about 80 minutes, it's very likely someone
# merged to $CI_BRANCH in the meanwhile, which would invalidate some hints. So, we
# reset to origin/$CI_BRANCH, take in our hints, and push. This is short enough that
# the chances of someone merging in-between fetch and push are low.
function refresh_hints() {
    local msg="regenerate hints + ocaml snapshot"
    local hints_dir="."
    
    # Add all the hints, even those not under version control
    find $hints_dir/doc -iname '*.hints' | xargs git add
    find $hints_dir/examples -iname '*.hints' | xargs git add
    find $hints_dir/ulib -iname '*.hints' | xargs git add

    git_add_fstar_snapshot

    # Commit only if changes were staged.
    # From: https://stackoverflow.com/a/2659808
    if ! git diff-index --quiet --cached HEAD -- ; then
	git commit -m "[CI] $msg"
    else
	echo "Hints/snapshot update: no diff"
    fi

    # Update the version number in version.txt and fstar.opam, and if
    # so, commit. Do this only for the master branch.
    if is_protected_branch ; then
        update_version_number
    fi

    # Memorize the latest commit (which might have been a version number update)
    commit=$(git rev-parse HEAD)

    # If nothing has been committed (neither hints nor version number), then exit.
    if [[ $commit = $last_commit ]] ; then
       echo "Nothing has been committed"
       return 0
    fi

    # Drop any other files that were modified as part of the build (e.g.
    # parse.fsi)
    git reset --hard HEAD
    # Move to whatever is the most recent master (that most likely changed in the
    # meantime)
    git fetch
    git checkout $CI_BRANCH
    git reset --hard origin/$CI_BRANCH
    # Silent, always-successful merge
    export GIT_MERGE_AUTOEDIT=no
    git merge $commit -Xtheirs

    if is_protected_branch ; then
        # We cannot directly push on master because it is protected
        # So we need to create a new build hints branch.
        # Check if build hints branch exist on remote and remove it if it exists
        new_branch=_BuildHints-$CI_BRANCH
        exist=$(git branch -a | egrep 'remotes/origin/'$new_branch | wc -l)
        if [ $exist == 1 ]; then
            git push $remote :$new_branch
        fi
        git checkout -b $new_branch
    else
        new_branch=$CI_BRANCH
    fi

    # Push.
    git push $remote $new_branch

    # Create a pull request if we pushed to a different branch
    if is_protected_branch ; then
        $gh pr create --base "$CI_BRANCH" --title "Advance to $(cat version.txt)" --fill
    fi
}

release () {
        # Make and test a release
        FSTAR_HOME= KRML_HOME= GH_TOKEN=$DZOMO_GITHUB_TOKEN CI_BRANCH=$CI_BRANCH .scripts/process_build.sh
}

build_and_refresh () {
    make dune-fstar
    make -j "$CI_THREADS" hints
    refresh_hints
}

build_refresh_and_release () {
    build_and_refresh
    release
}

# Switch back to the F* root directory (which we assume is the parent
# of the directory where this script lives
cd $(cd `dirname $0`/.. && pwd)

# Figure out the branch
CI_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "Current branch_name=$CI_BRANCH"

# How many threads do we need?
if [[ -z "$CI_THREADS" ]] ; then
    CI_THREADS=24
fi

# We need a GitHub token
if [[ -z "$DZOMO_GITHUB_TOKEN" ]] ; then
    echo "Please provide a GitHub token into the DZOMO_GITHUB_TOKEN environment variable"
    exit 1
fi

# Identify the committer
git config --global user.name "Dzomo, the Everest Yak"
git config --global user.email "everbld@microsoft.com"

# Record the latest commit
last_commit=$(git rev-parse HEAD)

# Repository to which we should push
remote="https://$DZOMO_GITHUB_TOKEN@github.com/FStarLang/FStar.git"

gh="env GH_TOKEN=$DZOMO_GITHUB_TOKEN gh -R FStarLang/FStar"

case "$1" in
    (refresh_fstar_hints)
        refresh_hints
        ;;
    (build_refresh_and_release)
        build_refresh_and_release
        ;;
    (build_and_refresh)
        build_and_refresh
        ;;
    (*)
        echo "What do you want to do? (refresh_fstar_hints | build_refresh_and_release | build_and_refresh)"
        exit 1
esac
