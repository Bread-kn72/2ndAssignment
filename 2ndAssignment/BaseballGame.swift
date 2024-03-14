import Foundation

// BaseballGame.swift 파일 생성
// BaseballGame 클래스 생성, 게임을 시작하는 함수 생성
class BaseballGame {
    func mainStart() {
        var isRunning : Bool = true
        while isRunning {
            // 유저에게 입력값을 받음
            print("환영합니다! 원하시는 번호를 입력해주세요 \n",
                  "1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기 \n")
            guard let userFirstInput = readLine(), userFirstInput.count == 1 else {
                print("올바르지 않은 입력값입니다. 한자리 숫자만 입력 해 주세요")
                continue
            }
            // 숫자가 아닌걸 입력 시
            guard let userFistNumber = Int(userFirstInput) else {
                print("잘못된 입력입니다. 숫자가 아닙니다.")
                continue
            }
            guard userFistNumber < 4 else {
                print("올바르지 않은 입력값입니다. 3가지 선택지 중 하나만 입력 해 주세요")
                continue
            }
            
            // switch구문으로 입력값에 따라 처리
            switch userFistNumber {
            case 1 :
                start()
            case 3 :
                print("< 숫자 야구 게임을 종료합니다 >")
                isRunning = false
            default:
                break
            }
        }
    }
    
    
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        print("<게임을 시작합니다>")
        // break가 나오기 전까진 무한 반복하는 코드
        while true {
            //유저에게 입력값을 받음, 조건 추가로 3자리 숫자 확인
            print("세 자리 숫자를 입력하세요:")
            guard let userInput = readLine(), userInput.count == 3 else {
                print("올바르지 않은 입력값입니다.")
                continue
            }
            // 숫자가 아니거나 중복된 숫자가 있는경우 에러가 나오는 프로퍼티, 조건 추가로 중복된 숫자를 확인하는 함수 추가
            guard let userNumber = Int(userInput), isValidNumber(userNumber) else {
                print("잘못된 입력입니다. 숫자가 아니거나, 맨 앞자리가 0을 포함하거나 중복된 숫자가 있습니다.")
                continue
            }
            // 스트라이크와 볼 개수를 프린트하는 상수, 계산하는 함수를 넣어 두가지 값에 strikes, balls 두 값을 반환하도록 설정
            let (strikes, balls) = compare(answer, userNumber)
            print("\(strikes)스트라이크, \(balls)볼")
            
            // strikes가 3개라면 정답을 프린트 + 브레이크로 while문 마무리
            if strikes == 3 {
                print("정답입니다!")
                break
            }
        }
    }
    // 정답을 만드는 함수, 빈 변수를 하나 만든 뒤 1...9까지 임의의 값을 3번 반복해서 만들어냄 두번째 반복부터는 10이 곱해짐
    // 정답이 되는 숫자를 0에서 9까지, 단 첫번째 수는 0이 될 수 없음 if문으로 조건 추가
    func makeAnswer() -> Int {
        var result = 0
        for i in 0..<3 {
            var digit = 0
            if i == 0 {
                digit = Int.random(in: 1...9)
            } else {
                digit = Int.random(in: 0...9)
            }
            result = result * 10 + digit
        }
        return result
    }
    // 숫자가 아니거나 중복된 숫자가 있는경우를 확인하는 함수, 셋을 이용하여 중복값이 없도록 참 거짓 구분
    func isValidNumber(_ number: Int) -> Bool {
        let digits = Array(String(number))
        return Set(digits).count == 3
    }
    
    // 숫자를 비교하는 함수, 정답과 추측 수를 배열로 만들어 서로 비교 후 반복문으로 스트라이크와 볼 갯수를 입력 후 반환
    func compare (_ answer: Int, _ guess: Int) -> (strikes: Int, balls: Int) {
        let answerDigits = Array(String(answer))
        let guessDigits = Array(String(guess))
        
        var strikes = 0
        var balls = 0
        
        for i in 0..<3 {
            if guessDigits[i] == answerDigits[i] {
                strikes += 1
            } else if answerDigits.contains(guessDigits[i]) {
                balls += 1
            }
        }
        return (strikes, balls)
    }
}
    
    
    
class RecordManager: BaseballGame {
    // 게임 기록 창을 여는 함수
    func showRecords() {
        print("< 게임 기록 보기 >")
        // \(gameTry)번째 게임 : 시도 횟수 - \(compareTry)
        print("다시 돌아가시려면 1을 눌러주세요")
        while true {
            guard let recordInput = readLine(), recordInput.count == 1 else {
                print("한자리 숫자만 가능합니다.")
                continue
            }
            guard let recordNumber = Int(recordInput) else {
                print("잘못된 입력입니다. 숫자가 아니거나, 맨 앞자리가 0을 포함하거나 중복된 숫자가 있습니다.")
                continue
            }
            switch recordNumber {
            case 1 :
                mainStart()
                break
            default:
                break
            }
        }
    }
    // 비교 시도 체크 횟수
    func add(_ trialCount: Int) -> Int {
        var addResult: Int = 0
        addResult += trialCount
        return addResult
    }
    
    func Try(_ comePareTry: Int) -> Int {
        var tryAddResult: Int = 0
        tryAddResult += comePareTry
        return tryAddResult
    }
}

