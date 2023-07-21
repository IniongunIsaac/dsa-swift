import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */

func solution(A: [Int], K: Int) -> [Int] {
    var contents = A
    var shiftedItems = [Int]()
    var max = A.count - 1
    for _ in 1...K {
        shiftedItems.insert(contents[max], at: 0)
        contents.remove(at: max)
        max -= 1
    }
    shiftedItems.append(contentsOf: contents)
    return shiftedItems
}

func solution1(A: [Int], K: Int) -> [Int] {
    var contents = A
    for index in 0..<K {
        var temp = contents[index]
        contents[0] = contents.last ?? 0
        contents[contents.count - 1] = temp
    }
    return contents
}

//solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
//solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
//solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2
//
//solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]

defer { print("a") }
