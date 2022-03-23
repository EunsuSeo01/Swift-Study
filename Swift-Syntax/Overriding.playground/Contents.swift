// super class
class NoteBook {
    var name = ""
    
    func turnOn() {
        print("Booting...")
    }
}

// class 클래스이름: 상속받을 클래스이름
// sub class
class MacBook: NoteBook {
    var hasTouchBar = false  // MacBook만의 특징들을 추가.
    var macOSVersion = "12.2.1"
    
    override func turnOn() {
        super.turnOn()
        print("\(name)'s current macOSVersion is \(macOSVersion)")
    }
}

let macBook = MacBook()
macBook.name = "은수의 MacBook Air"
macBook.turnOn()


// 소멸자 예제.
class Circle {
    var radius = 9
    
    init() {
        print("Initializer called")
    }
    
    deinit {
        print("Deinitializer called")
    }
}

if true{
    var circle1 = Circle() // 생성자 호출.
    print("아직 scope 안이야! 난 아직 살아있어")
}

