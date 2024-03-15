//
//  BaseballGame.swift
//  Baseball
//
//  Created by woochan on 3/14/24.
//

import Foundation

class BaseballGame {
  
  /**
   1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
   정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
   */
  func start() {
    
    var tryCountPerGame: [Int] = []
    
    while true {
      showGreetingMessage()
      
      let option = readLine() ?? ""
      
      switch option {
      case "1":
        let tryCount = playOneGame()
        tryCountPerGame.append(tryCount)
      case "2":
        showGameLog(tryCountPerGame)
      case "3":
        print("< 숫자 야구 게임을 종료합니다 >")
        exit(0)
        break
      default:
        print("올바른 숫자를 입력해주세요!")
        print()
      }
    }
  }
  
  func makeAnswer() -> [Int] {
    
    let arr = (0...9).map { $0 }
    
    let shuffledArray = arr.shuffled()
    
    if shuffledArray[0] == 0 {
      return [Int](shuffledArray[1...3])
    } else {
      return [Int](shuffledArray[0...2])
    }
  }
  
  func validateInput(_ input: [Int]) -> Bool {
    input.count == 3
  }
  
  func showGreetingMessage() {
    
    let greetingMessage = """
    환영합니다! 원하시는 번호를 입력해주세요
    1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
    """
    
    print(greetingMessage)
  }
  
  // 반환값: 이번 게임의 시도 횟수
  func playOneGame() -> Int {
    
    var tryCount = 0
    
    let answer = makeAnswer()
    print("정답:", answer)
    
    print("< 게임을 시작합니다 >")
    
    while true {
      
      print("숫자를 입력하세요")
      let input = readLine() ?? ""
      tryCount += 1
      
      // "123ㄱ"
      // ["1", "2", "3", "ㄱ"]
      // [1, 2, 3]
      let numberArray = input.map { String($0) }.compactMap { Int($0) }
      
      let isValidate = validateInput(numberArray)
      
      guard isValidate else {
        print("올바르지 않은 입력 값입니다.")
        print()
        continue
      }
      
      var strike = 0
      var ball = 0
      
      // 사용자가 입력한 숫자 순회
      for (index, number) in numberArray.enumerated() {
        
        // 스트라이크
        if number == answer[index] {
          strike += 1
          continue
        }
        
        // 볼인지 판단
        if answer.contains(number) {
          ball += 1
          continue
        }
      }
      
      if strike == 0 && ball == 0 {
        print("Nothing")
      } else if strike == 3 {
        print("정답입니다!")
        print()
        return tryCount
      } else {
        print("\(strike)스트라이크", terminator: " ")
        print("\(ball)볼")
      }
      
      print()
    }
    
  }
  
  func showGameLog(_ tryCountPerGame: [Int]) {
    print("< 게임 기록 보기 >")
    for (index, tryCount) in tryCountPerGame.enumerated() {
      print("\(index+1)번째 게임 : 시도 횟수 - \(tryCount)")
    }
    print()
  }
}
