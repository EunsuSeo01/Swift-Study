// String
var message = "Hello, playground!"

// Bool
var isLogin = false

// Int
var day = 2

// Double
var height = 154.5

/*
 Swift는 자료형을 직접 선언해 주지 않아도 할당되는 값으로
 자료형을 추측하여 선언해 준다.
 */

// String으로 직접 선언
var messageTwo: String
messageTwo = "Hi"

// Int로 직접 선언
var dayTwo: Int
dayTwo = 3

// Bool로 직접 선언
var isLogout: Bool
isLogout = true

// Double, Float로 직접 선언
var width: Double

var widthTwo: Float

width = 30.3;
widthTwo = 50.555;

/*
 초기화를 선언과 동시에 해주지 않을 거면 위처럼 : 뒤에 자료형을 명시적으로 적어서
 선언하면 된다. 또한 Swift는 type safe language로, 타입이 한번 정해지면
 다른 타입의 데이터를 저장할 수 없도록 되어있다.
 */

var integer : Int64
integer = 5

UInt8.min // 8bit Unsigned Int의 최솟값: 0
UInt8.max // 8bit Unsigned Int의 최댓값: 255

Int8.min // 8bit Int의 최솟값: -128
Int8.max // 8bit Int의 최댓값: 127

UInt16.min
UInt16.max

Int16.max
Int16.min

Int32.min
Int32.max

Int64.min
Int64.max


