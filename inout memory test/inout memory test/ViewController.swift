// Swift 소스 파일
import UIKit

class ViewController: UIViewController {

    var two = 2
    var three = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = multiple(num1: two, num2: &three) // return값을 사용하지 않고 생략한 것.
        print(three)
    }

    func multiple(num1: Int, num2: inout Int) -> Int {
        num2 = 5
        return num1 * num2
    }


}

