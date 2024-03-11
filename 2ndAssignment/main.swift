
import Foundation

// LV.1 세자리 임의의 숫자 만들기
func createNumber() -> Int {
    var result : Int = 0
    for i in 0..<3 {
        result = result * 10 + Int.random(in: 0...9)
    }
    return result
}

