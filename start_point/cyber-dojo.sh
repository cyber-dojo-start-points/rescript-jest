# jest cannot use ts-jest when installed globally.
# npm packages are in /etc/ts/
# We have to create a local symlink.
ln -s /etc/ts/node_modules ${CYBER_DOJO_SANDBOX}/node_modules

function cyber_dojo_exit()
{
  # Ensure the symlink is removed.
  unlink ${CYBER_DOJO_SANDBOX}/node_modules
}
trap cyber_dojo_exit EXIT SIGTERM

npm run typecheck || exit 42

#Uncomment this line to enable linting.
#Note: this will slow down the test.
#npm run lint

npm run test
