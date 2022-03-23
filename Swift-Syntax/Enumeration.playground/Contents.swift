// 열거형
enum AppleOS: Int {
    case iOS = 5
    case macOS
    case tvOS
    case watchOS
}

// var osType: AppleOS = AppleOS.iOS
var osType: AppleOS = .macOS
print(osType.rawValue)

func printAppleDevice(os: AppleOS) {
    switch os {
    case .iOS:
        print("iPhone")
    case .macOS:
        print("iMac")
    case .tvOS:
        print("Apple TV")
    case .watchOS:
        print("Apple watch")
    }
}

printAppleDevice(os: osType)
