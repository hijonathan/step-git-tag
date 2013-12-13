# Wercker Git Tag Step

Updates git tags so you know what's currently deployed.

## Configuring

This step requires you to create a tokenized URL to your remote git repo. To do that:

1. [Create a new application token](https://github.com/settings/tokens/new) for Wercker.
2. Create a Wercker environment variable for your deploy called `GIT_REMOTE`.
3. Set the value of `GIT_REMOTE` to `https://{TOKEN}@github.com/{ACCOUNT}/{REPOSITORY}.git` where `{TOKEN}` is the token you created in step 1, and `{ACCOUNT}` and `{REPOSITORY}` are your git repo information.

And that's it. You should now be able to use this step in your `wercker.yml` file.

## Options

Step has no option.

## Example

    - git-tag
