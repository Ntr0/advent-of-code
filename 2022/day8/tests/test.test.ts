import { testme } from "../src/test";

describe ("test", () => {
    test('this', () => {
        expect(testme()).toBe(0)
    })
})