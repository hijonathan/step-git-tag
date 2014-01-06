if [ $DEPLOY != "true" ]; then
    fail 'this step is only valid for deploys'
fi

# Configure Git.
if [ "$WERCKER_RESULT" = "passed" ]; then
    # Configure git
    git config --global user.email pleasemailus@wercker.com
    git config --global user.name "wercker"
    debug 'configured git'

    # Get tags.
    git fetch --tags $GIT_REMOTE
    debug 'fetched git tags'

    # Create the name of the tag
    tagname="deploy-$WERCKER_DEPLOYTARGET_NAME"
    
    # Delete the tag if it exists, otherwise just skip
    if (git tag -l | grep "$tagname" &> /dev/null);
    then
        git tag -d "$tagname"
        debug 'Deleted existing $tagname'
    fi

    # Tag your commit.
    git tag -a deploy-$WERCKER_DEPLOYTARGET_NAME $WERCKER_GIT_COMMIT -m "Wercker deploy by $WERCKER_STARTED_BY :articulated_lorry:."
    git push --tags $GIT_REMOTE
else
    info "skipping git tag because the deploy result is $WERCKER_RESULT"
fi
