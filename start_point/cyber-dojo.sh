set -e

# npm packages are in /etc/rescript/
# The build transpiles files in this dir
# so the current user (sandbox) must have write rights there.

ln -s /etc/rescript/node_modules ${CYBER_DOJO_SANDBOX}/node_modules

# --------------------------------------------------------------
function cyber_dojo_exit()
{
  # Text files under /sandbox are automatically returned to the browser.
  # So remove text files we don't want returned.
  # 1) From ln command above
  rm -rf ${CYBER_DOJO_SANDBOX}/node_modules
  # 2) Generated files...
  rm -rf ${CYBER_DOJO_SANDBOX}/lib
  find ${CYBER_DOJO_SANDBOX}/src -maxdepth 10 -type f -name "*.bs.js" -delete
}
trap cyber_dojo_exit EXIT SIGTERM

# --------------------------------------------------------------

# Calling [npm run ...] is sloooow so don't do that. npm looks for a newer
# version of itself, the sandbox user has no cached answer from the image
# build, and the container has no network for the lookup to reach, so it waits
# out a timeout of several seconds on every run.
#
# rescript colours its error messages and honours neither NO_COLOR nor
# FORCE_COLOR, so the escape codes are stripped. Left in, they reach the
# browser as literal characters in the middle of the compiler's message. It
# reports those errors on stderr, which is why stderr joins the pipe: stripping
# stdout alone leaves every error message coloured, that being the only output
# with any colour in it.
#
# The status has to come from PIPESTATUS: sed exits zero even when the compile
# it filters failed, and a failed compile must stop the run before the tests,
# so that what the browser shows is the compiler error and not a list of tests
# that could not be found.
node_modules/.bin/rescript build 2>&1 | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g'
build_status="${PIPESTATUS[0]}"
if [ "${build_status}" != '0' ]; then
  exit "${build_status}"
fi

node_modules/.bin/jest --env=node --maxWorkers=2
