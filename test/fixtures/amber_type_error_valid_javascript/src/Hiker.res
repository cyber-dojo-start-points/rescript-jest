// In JavaScript 6 * "7" coerces the string and evaluates to 42.
// ReScript's * takes two ints, so the compiler refuses this before
// jest ever sees it.
let answer = () => 6 * "7"
