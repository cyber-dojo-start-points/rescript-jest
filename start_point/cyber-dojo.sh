set -e

# npm packages are in /etc/rescript/
# Rescript compiles some .re into .bs.js files in this dir.
# So we have to create a copy where we have permissions.
cp -R /etc/rescript/node_modules ${CYBER_DOJO_SANDBOX}/node_modules

# --------------------------------------------------------------
function cyber_dojo_exit()
{
  # Text files under /sandbox are automatically returned...
  # So remove text files we don't want returned.
  rm -rf ${CYBER_DOJO_SANDBOX}/node_modules
  rm -rf ${CYBER_DOJO_SANDBOX}/lib
  rm ${CYBER_DOJO_SANDBOX}/.merlin
  rm ${CYBER_DOJO_SANDBOX}/src/*.bs.js
}
trap cyber_dojo_exit EXIT SIGTERM

# --------------------------------------------------------------
npm run build
npm run test
