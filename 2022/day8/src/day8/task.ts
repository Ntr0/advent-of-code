import * as fs from 'fs';


function loadData(): string {
    let buf = fs.readFileSync('input-8.txt')
    return buf.toString()
}

interface Tree {
    height: number
    visible: boolean
}
export function processInput(input: string): Tree[][] {
    let result: Tree[][] = []

    for (const line of input.split("\n")) {
        if (line == "") {
            continue
        }
        let row: Tree[] = []
        for (const digit of line.split("")) {
            let heigth = parseInt(digit, 10)
            row.push({ height: heigth, visible: false })
        }
        result.push(row)
    }

    return result
}

const enum Side {
    West = "West",
    East = "East",
    North = "North",
    South = "South"
}
/*
export function getVisibleTreesLine(forest: number[][], side: Side): number {
    let visible = 0
    let max = -1
    let countCols = false
    switch (side) {
        case Side.West: startR
    }
    for (let r = 0; r <= rows; r++) {
        let minLeft = -1
        for (let c = 0; c <= cols; c++) {
            const tree = forest[r][c]
            if (maxLeft == -1 && maxLeft < tree) {
                maxLeft = tree
                visible++
            }
            if (tree == 9) {
                break
            }
        }
    }
    return visible
}

*/
export function getVisibleTrees(forest: Tree[][]): number {
    let rows = forest.length
    let cols = forest[0].length
    let visible = 0
    for (let r = 0; r < rows; r++) {
        let maxLeft = -1
        for (let c = 0; c < cols; c++) {
            let tree = forest[r][c]
            if (maxLeft < tree.height) {
                maxLeft = tree.height
                if (!tree.visible) {
                    visible++
                }
                tree.visible = true
            }
            if (tree.height == 9) {
                break
            }
        }
        maxLeft = -1
        for (let c = cols - 1; c >= 0; c--) {
            const tree = forest[r][c]
            if (maxLeft < tree.height) {
                maxLeft = tree.height
                if (!tree.visible) {
                    visible++
                }
                tree.visible = true
            }
        }
    }
    for (let c = 0; c < cols; c++) {
        let maxLeft = -1
        for (let r = 0; r < rows; r++) {
            let tree = forest[r][c]
            if (maxLeft < tree.height) {
                maxLeft = tree.height
                if (!tree.visible) {
                    visible++
                }
                tree.visible = true
            }
            if (tree.height == 9) {
                break
            }
        }

        maxLeft = -1
        for (let r = rows - 1; r >= 0; r--) {
            let tree = forest[r][c]
            if (maxLeft < tree.height) {
                maxLeft = tree.height
                if (!tree.visible) {
                    visible++
                }
                tree.visible = true
            }
            if (tree.height == 9) {
                break
            }
        }
    }
    return visible
}
function scoreTree(col: number, row: number, forest: Tree[][]): number {
    let rows = forest.length
    let cols = forest[0].length
    let score = 1
    let mult = 0
    for (let c = col + 1; c < cols; c++) {
        mult++
        if (forest[c][row].height >= forest[col][row].height) {
            break
        }
    }
    score *= mult
    mult = 0
    for (let c = col - 1; c >= 0; c--) {
        mult++
        if (forest[c][row].height >= forest[col][row].height) {
            break
        }
    }
    score *= mult
    mult = 0
    for (let r = row - 1; r >= 0; r--) {
        mult++
        if (forest[col][r].height >= forest[col][row].height) {
            break
        }
    }
    score *= mult
    mult = 0
    for (let r = row + 1; r < rows; r++) {
        mult++
        if (forest[col][r].height >= forest[col][row].height) {
            break
        }
    }
    return score * mult
}

export function partTwo(input: string): number {
    let forest = processInput(input)
    let rows = forest.length
    let cols = forest[0].length
    let maxScore = 0
    for (let c = 1; c < cols - 1; c++) {
        for (let r = 1; r < rows - 1; r++) {
            let score = scoreTree(c, r, forest)
            if (score > maxScore) {
                maxScore = score
            }
        }
    }
    return maxScore
}
console.log(getVisibleTrees(processInput(loadData())))