//: Playground - noun: a place where people can play

import UIKit

/*
 
566. Reshape the Matrix
 
 In MATLAB, there is a very useful function called 'reshape', which can reshape a matrix into a new one
 with different size but keep its original data.
 
 You're given a matrix represented by a two-dimensional array, and two positive integers r and c
 representing the row number and column number of the wanted reshaped matrix, respectively.
 
 The reshaped matrix need to be filled with all the elements of the original matrix
 in the same row-traversing order as they were.
 
 If the 'reshape' operation with given parameters is possible and legal,
 output the new reshaped matrix; Otherwise, output the original matrix.
 
 
 Example 1:
    Input:
        nums =
            [ [1,2],
              [3,4] ]
        r = 1, c = 4
 
    Output:
        [[1,2,3,4]]
 
    Explanation:
        The row-traversing of nums is [1,2,3,4]. The new reshaped matrix is a 1 * 4 matrix,
        fill it row by row by using the previous list.
 
 Example 2:
    Input:
        nums =
            [ [1,2],
              [3,4] ]
        r = 2, c = 4

    Output:
        [ [1,2],
          [3,4] ]
    Explanation:
        There is no way to reshape a 2 * 2 matrix to a 2 * 4 matrix. So output the original matrix.
 
 Note:
    The height and width of the given matrix is in range [1, 100].
    The given r and c are all positive.
 
 */


/*
    [ [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9] ]
 
 r: Int, _ c: Int
 
 */

class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        
        guard nums.count > 0 else {
            return nums
        }
        
        let originRows = nums.count
        let originColumns = nums.first?.count ?? 0
        
        guard (r * c) <= (originRows * originColumns) else {
            return nums
        }
        
        let blankRow = Array.init(repeating: 0, count: c)
        var result = Array.init(repeating: blankRow, count: r)
        
        var row: Int = 0
        var column: Int = 0
        
        for i in 0..<originRows {
            for j in 0..<originColumns {
                
                result[row][column] = nums[i][j]
                column += 1
                
                if column == c {
                    row += 1
                    column = 0
                }
            }
        }
        return result
    }
}


/* Tests: */

let m1 = [[1, 2],
          [3, 4]]

Solution().matrixReshape(m1, 1, 4)
Solution().matrixReshape(m1, 2, 4)
Solution().matrixReshape(m1, 2, 2)
Solution().matrixReshape(m1, 4, 1)
