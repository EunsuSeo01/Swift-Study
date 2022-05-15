//
//  ViewController.swift
//  RandomGradientColorMusic
//
//  Created by 서은수 on 2022/05/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var musicPlayImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradient(color0: .white, color1: .red, color2: .green, color3: .blue)
        view.addSubview(musicPlayImageView)
    }


}

extension UIView{
    
    func setGradient(color0: UIColor, color1: UIColor, color2: UIColor, color3: UIColor){
        
        let gradient = CAGradientLayer()
        gradient.colors = [color0.cgColor, color1.cgColor, color0.cgColor, color2.cgColor, color0.cgColor, color3.cgColor, color0.cgColor,]
        gradient.locations = [0.15, 0.2, 0.4, 0.45, 0.65, 0.7]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}
