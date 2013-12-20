# Configure Git.
if [ "$WERCKER_RESULT" = "passed" ]; then
    # Configure git
    git config --global user.email pleasemailus@wercker.com
    git config --global user.name "wercker"

    # Get tags.
    git fetch --tags $GIT_REMOTE

    # Create the name of the tag
    tagname="deploy-$WERCKER_DEPLOYTARGET_NAME"
    
    # Delete the tag if it exists, otherwise just skip
    (git tag -l | grep "$tagname") && git tag -d "$tagname" 

    # Tag your commit.
    git tag -a deploy-$WERCKER_DEPLOYTARGET_NAME $WERCKER_GIT_COMMIT -m "Wercker deploy by $WERCKER_STARTED_BY :articulated_lorry:."
    git push --tags $GIT_REMOTE
fi
