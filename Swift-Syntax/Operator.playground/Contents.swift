// 산술 연산자
var weight = 30
weight += 10
weight -= 10
weight *= 10
weight /= 10
weight %= 10

// 비교 연산자 -> 결과값이 Bool값으로 나온다.
// >, <, ==, !=
let age = 14 // let은 상수 선언
let isAdult = age >= 20 // 비교 연산자 식이 먼저 계산되고 대입 연산자 실행됨.
let 중1 = age == 14

// 논리 연산자 -> 비교 연산자 이후에 실행.
// &&. ||, ! -> AND, OR, NOT
// 조건식1 && 조건식2 => 조건식 모두가 true여야 결과가 true
// 조건식1 || 조건식2 => 조건식 중에 하나만 true이면 결과가 true
// ! => true면 false로, false면 true로 바꿔줌.
let 초등학생 = age >= 8 && age <= 13
