// Writing straight to stderr bypasses jest's console capture, so the
// line arrives as itself rather than inside a console.error report.
let debug: string => unit = %raw(`function(s) { process.stderr.write(s + "\n"); }`)

let answer = () => {
  debug("answer was called")
  6 * 7
}
