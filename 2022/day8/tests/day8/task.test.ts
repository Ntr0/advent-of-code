import { info } from "console";
import exp from "constants";
import * as fs  from 'fs';

import { processInput, getVisibleTrees, partTwo } from "../../src/day8/task";

const input = "30373\n25512\n65332\n33549\n35390"

function loadData(): string {
    let buf = fs.readFileSync('input-8.txt')
    return buf.toString()
}
/*
describe("test process input", () => {
    test("with given input", () => {
        expect(processInput(input)).toEqual([[3, 0, 3, 7, 3], [2, 5, 5, 1, 2], [6, 5, 3, 3, 2], [3, 3, 5, 4, 9], [3, 5, 3, 9, 0]])
    })
})
*/

describe("test visibletrees", () => {
    test("with given input", () => {
        let forest = processInput(input)
        expect(getVisibleTrees(forest)).toEqual(21)
    })
})

describe("test part two", () => {
    test("with example input", () => {
        expect(partTwo(input)).toEqual(8)
    })
    test("with my input", () => {
        expect(partTwo(loadData())).toEqual(172224)
    })
})