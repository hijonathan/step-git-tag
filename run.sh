# Configure Git.
if [ "$WERCKER_RESULT" = "passed" ]; then
    git config --global user.email pleasemailus@wercker.com
    git config --global user.name "wercker"

    # Tag your commit.
    git tag -d deploy-$WERCKER_DEPLOYTARGET_NAME
    git tag -a deploy-$WERCKER_DEPLOYTARGET_NAME $WERCKER_GIT_COMMIT -m "Wercker deploy by $WERCKER_STARTED_BY :articulated_lorry:."
    git push --tags $GIT_REMOTE
fi
