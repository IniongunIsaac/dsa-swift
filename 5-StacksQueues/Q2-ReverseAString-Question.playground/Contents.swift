import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */

func solution(_ text: String) -> String {
    var array = Array(text)
    var result = ""
    for _ in 0..<array.count {
        result.append(array.removeLast())
    }
    return result
}

solution("abc") // cba
solution("Would you like to play a game?")
