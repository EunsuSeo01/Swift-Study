var toDoDicLong : Dictionary<Int, String> = [11: "Play", 12: "Work", 14: "Drink"]
var toDoDic = [11: "Play", 12: "Work", 14: "Drink"]

print(toDoDic.keys) // key값들만 출력
print(toDoDic.values) // value값들만 출력

toDoDic[11] = "Drink"  // 단순 할당만으로 값 변경 가능
print(toDoDic) // 전체 출력

toDoDic[12]
print(toDoDic[12]!) // key 12의 value값만 출력

// 값 삭제하는 법 1
toDoDic.removeValue(forKey: 11) // key:value쌍 하나 삭제.
print(toDoDic)

// 값 삭제하는 법 2
toDoDic[12] = nil // nil = 값이 없다. 무.
// -> key 12에 해당하는 value를 없앤다는 뜻.
print(toDoDic)

// 값 추가
toDoDic[15] = "Study" // 값 추가도 단순 할당으로 가능!
print(toDoDic)

// for-in문 사용해서 출력
for (k, v) in toDoDic {
    print("key: \(k), value: \(v)")
}  // (key, value) 쌍으로 받아와서 출력.

// key만
for k in toDoDic.keys {
    print(k)
}

// value만
for v in toDoDic.values {
    print(v)
}
