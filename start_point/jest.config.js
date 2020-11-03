module.exports = {
  transform: {
    "^.+\\.tsx?$": "ts-jest",
  },
  testEnvironment: "node",
  testRegex: ".*test\\.(t|j)sx?$",
  moduleFileExtensions: ["ts", "tsx", "js", "jsx", "json", "node"]
};
