open Jest
open Expect

test("to life the universe and everything", () => {
  expect(Hiker.answr())->toEqual(42)
})
