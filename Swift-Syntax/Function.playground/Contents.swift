func hello(name: String) -> String {
    return "Hello~ \(name)!"
    // return "Hello~ " + name + "!"
}

print(hello(name: "Seori"))

func addTwoNum(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

print(addTwoNum(n1: 2, n2: 3))

func addTwoNumbers(num1: Int, num2: Int = 100) -> Int {
    let sum = num1 + num2
    return sum
}

addTwoNumbers(num1: 5)  // 5 + 100(기본값) = 105
addTwoNumbers(num1: 2, num2: 3)  // 5

func addNumbers(numbers: Int...) -> Int {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return sum
}

addNumbers(numbers: 1, 2, 3, 4, 5) // comma(,)로 구분해서 여러 개 넣어준다.

// 입력값이 없고 반환값이 튜플 형태인 함수이다.
func myInfo() -> (name: String, age: Int, weight: Int) {
    return ("은수", 22, 50)
}

let info = myInfo()
print(info.name) // name값인 String 타입의 "은수"만 출력.
print(info.age)  // age값인 Int 타입의 22만 출력.
print(info) // 튜플 형태로 출력 -> ("은수", 22)


print(123, "Hello", true, 123.456, separator: "~", terminator: "")
print("test")


func calculate(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

func calculate(devideFirstNumber num1: Int, bySecondNumber num2: Int) -> Int {
    return num1 / num2
}

calculate(10, 5)
calculate(devideFirstNumber: 10, bySecondNumber: 5)

func multiple(num1: Int, num2: inout Int) -> Int {
    num2 = 5
    return num1 * num2
}

var two = 2
var three = 3
multiple(num1: two, num2: &three)
