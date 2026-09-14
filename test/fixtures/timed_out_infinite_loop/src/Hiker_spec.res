open Jest
open Expect

// The loop sits at module scope, outside any test, so jest's per-test timeout
// never applies and the hang cannot degrade into an ordinary test failure.
while Hiker.answer() == 42 {
  ()
}

test("to life the universe and everything", () => {
  expect(Hiker.answer())->toEqual(42)
})
