// 노가다 버전...
10.0 * 10.0 * 3.1415926535
20.0 * 20.0 * 3.1415926535
30.0 * 30.0 * 3.1415926535

// 변수와 상수를 사용한 버전
var radius = 10.0
let pi = 3.1415926535

radius * radius * pi

radius = 20.0
radius * radius * pi

radius = 30.0
radius * radius * pi

// 함수를 사용한 버전
func area(r: Double) -> Double {
    return r * r * pi
}

area(r: 10.0)
area(r: 20.0)
area(r: 30.0)

// 클래스로 묶어준 것
class Circle {
    var radius: Double
    let pi = 3.1415926535
    
    init() {
        radius = 10.0
    }
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return radius * radius * pi
    }
}

let circle = Circle() // Circle.init()과 같음.
let circle2 = Circle(radius: 20.0)

circle.radius
circle.area()

circle2.radius
circle2.area()

// var weight = 65
var weight = Int(65) // Int.init(65)
// var message = "Hello"
var message = String("Hello") // String.init("Hello")

// var evenNumber = [2, 4, 6, 8]
var evenNumber = [Int](arrayLiteral: 2, 4, 6, 8)
var oddNumber = Array<Int>(arrayLiteral: 1, 3, 5, 7)

class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let seori = Person(name: "EunSu", age: 22)
