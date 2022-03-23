let month = 3
let toDo = "Travel"

// Collection 타입 중 배열
// 위와 같은 값 여러 개를 하나의 변수에 담을 수 있다.
var toDoArray = ["Travel", "Work", "Call"]
var evenNumber = [2, 4, 6, 8]

toDoArray[0] = "Play"  // 배열 안의 값 변경
toDoArray[1]

evenNumber.append(10)
evenNumber.insert(12, at: 0)
evenNumber.remove(at: 0)
print(evenNumber)

for i in toDoArray {
    print(i)
}
