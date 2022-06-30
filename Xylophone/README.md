![App Brewery Banner](Documentation/AppBreweryBanner.png)

# Xylophone

## Our Goal

The goal of this tutorial is to dive into a simple iOS recipe - how to play sound and use an Apple library called AVFoundation. The most important skill of a great programmer is being able to solve your own problems. We’ll do that by exploring StackOverflow, Apple Documentation and learning how to search for solutions effectively. By learning to use these tools, you’ll be able to start adding custom features to an app and get it to do what you want it to.


## What you will create

You will be making your first musical instrument! Music apps are so popular on the App Store that they even get their own category. So in this module, we’re going to make a colourful XyloPhone app. Get it? Ok, the jokes are bad, but remember, I only wrote the good ones... 

## What you will learn

* How to play sound using AVFoundation and AVAudioPlayer.
* Understand Apple documentation and how to use StackOverflow.
* Functions and methods in Swift. 
* Data types.
* Swift loops.
* Variable scope.
* The ViewController lifecycle.
* Error handling in Swift.
* Code refactoring.
* Basic debugging.

## Replacement Code

```
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "C", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
```



>This is a companion project to The App Brewery's Complete App Development Bootcamp, check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)

![End Banner](Documentation/readme-end-banner.png)

---
### My Note

챌린지 정답 - 초를 카운트 하는 방법 말고, 아예 코드를 특정 시간동안 **block**시키는 방법이 따로 있었다.   
-> **asyncAfter deadline**을 사용!!! 훨씬 간결하게 완성 가능.

```
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    sender.layer.opacity = 1.0
}
```

- DispatchQueue.main.asyncAfter deadline
    - Schedules a block for execution using the specified attributes, and returns immediately.
      = 지정된 특성을 사용하여 block(실행 차단)을 실행하도록 예약하고, 즉시 반환한다.
        
- parameter - deadline
    - The time at which to schedule the block for execution.
        = 실행 차단을 예약해둔 시간. 얼만큼 차단할지.  

그리고 나는 sender.layer.opacity를 통해 불투명도를 설정했지만, 정답에서는 sender.**alpha**를 통해 불투명도 값을 조절했다.
