set -e

# npm packages are in /etc/rescript/
# The [npm run build] command transpiles files in this dir
# so the current user (sandbox) must have write rights there.

ln -s /etc/rescript/node_modules ${CYBER_DOJO_SANDBOX}/node_modules

# --------------------------------------------------------------
function cyber_dojo_exit()
{
  # Text files under /sandbox are automatically returned to the browser.
  # So remove text files we don't want returned.
  # 1) From cp command above
  rm -rf ${CYBER_DOJO_SANDBOX}/node_modules
  # 2) Generated files...
  rm -rf ${CYBER_DOJO_SANDBOX}/lib
  rm ${CYBER_DOJO_SANDBOX}/.merlin
  find ${CYBER_DOJO_SANDBOX}/src -maxdepth 10 -type f -name "*.bs.js" -delete
}
trap cyber_dojo_exit EXIT SIGTERM

# --------------------------------------------------------------

npm run build
npm run test
