for i in 1...10 {
    print(i)
}

for i in stride(from: 1, to: 10, by: 2) {
    print(i)
}
for j in stride(from: 10, to: 1, by: -2) {
    print(j)
}

for i in 2...9 {
    print("\(i)단")
    for j in 1...9 {
        print("\(i) X \(j) = \(i * j)")
    }
}

var i = 0 // 초기식
while i < 10 { // while문엔 조건식이 들어감
    i += 1 // 1씩 증가
    print(i)
}

i = 0
repeat {
    i += 1
    print(i)
} while i < 10 // C언어의 do-while문과 같음
