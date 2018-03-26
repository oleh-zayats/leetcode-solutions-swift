import Foundation

/*
 766. Toeplitz Matrix
 
 A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
 Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
 
    Example 1:
        Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
        Output: True
        In the above grid, the diagonals are "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]", and in each diagonal all elements are the same, so the answer is True.
 
    Example 2:
        Input: matrix = [[1,2],[2,2]]
        Output: False
        The diagonal "[1, 2]" has different elements.
 

    Note:
        matrix will be a 2D array of integers.
        matrix will have a number of rows and columns in range [1, 20].
        matrix[i][j] will be integers in range [0, 99].
 */

class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        
        let totalRows = matrix.count
        
        guard totalRows > 0 else {
            return false
        }
        
        let totalColumns = matrix[0].count
        
        for row in 1..<totalRows {
            for column in 1..<totalColumns {
                
                let a = matrix[safe: row]?[safe:column]
                let b = matrix[safe: row - 1]?[safe: column - 1]
                
                if let a = a, let b = b, a != b {
                    return false
                }
            }
        }
        return true
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

/* Tests: */

let matrix0 = [[11, 74, 0, 93],
               [40, 11, 74, 7]]

let matrix1 = [[1, 2, 3, 4],
               [5, 1, 2, 3],
               [9, 5, 1, 2]]

let matrix2 = [[1, 2],
               [2, 2]]

let matrix3 = [[39, 24]]

let matrix4 = [[18],
               [66]]

let matrix5 = [[Int]]()

let matrix6 = [[1]]

let matrix7 = [[1, 1, 1, 1],
               [1, 1],
               [1, 1, 0]]

print(Solution().isToeplitzMatrix(matrix0)) // false
print(Solution().isToeplitzMatrix(matrix1)) // true
print(Solution().isToeplitzMatrix(matrix2)) // false
print(Solution().isToeplitzMatrix(matrix3)) // true
print(Solution().isToeplitzMatrix(matrix4)) // true
print(Solution().isToeplitzMatrix(matrix5)) // false
print(Solution().isToeplitzMatrix(matrix6)) // true
print(Solution().isToeplitzMatrix(matrix7)) // false



