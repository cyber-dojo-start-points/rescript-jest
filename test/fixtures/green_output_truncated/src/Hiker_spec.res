open Jest
open Expect

// jest writes its whole report to stderr, and process.stderr.write bypasses
// jest's console capture so these lines land ahead of it. Flooding past the
// runner's per-stream cap therefore cuts off the PASS line and the summary.
let debug: string => unit = %raw(`function(s) { process.stderr.write(s + "\n"); }`)

let rec flood = i =>
  if i != 4000 {
    debug("debug: i is " ++ Int.toString(i) ++ ", total is " ++ Int.toString(i * 2))
    flood(i + 1)
  }

test("to life the universe and everything", () => {
  flood(0)
  expect(Hiker.answer())->toEqual(42)
})
