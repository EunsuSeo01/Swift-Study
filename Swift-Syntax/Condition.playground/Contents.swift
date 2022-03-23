// if - else if - else 구문
var dust = 155

if dust <= 30 {
    print("상쾌하군")
}
else if dust > 30 && dust <= 50 {
    print("나쁘진 않군")
}
else if dust > 50 && dust <= 100 {
    print("안 좋군...")
}
else {
    print("최악이군...")
}


// switch문
var num = 5

switch num {
case 5,6,10:
    print("너구나!")
case 11:
    print("11 안녕")
default:
    print("넌 누구니?")
}
