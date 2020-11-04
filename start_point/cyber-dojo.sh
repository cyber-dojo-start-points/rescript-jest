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
  # From cp command above
  rm -rf ${CYBER_DOJO_SANDBOX}/node_modules
  # Generated files...
  rm -rf ${CYBER_DOJO_SANDBOX}/lib
  rm ${CYBER_DOJO_SANDBOX}/.merlin
  find ${CYBER_DOJO_SANDBOX}/src -maxdepth 10 -type f -name "*.bs.js" -delete
}
trap cyber_dojo_exit EXIT SIGTERM

# --------------------------------------------------------------
npm run build
npm run test
