open Jest
open Expect

test("to life the universe and everything", () => {
  expect(Adventurer.answer())->toEqual(42)
})
