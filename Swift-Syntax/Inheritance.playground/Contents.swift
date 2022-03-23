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
}

let macBook = MacBook()
macBook.name = "은수의 MacBook Air"
macBook.turnOn()

