open Jest;
open Expect;

test("to life the universe and everything", () => {
   expect(Hiker.answer()) |> toEqual(42)
});
