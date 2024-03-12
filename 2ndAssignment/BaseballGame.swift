import Foundation

// BaseballGame.swift 파일 생성
class BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
    }
    
    func makeAnswer() -> Int {
        // 함수 내부를 구현하기
        var result : Int = 0
        for _ in 0..<3 {
            result = result * 10 + Int.random(in: 0...9)
        }
        return result
    }
}

