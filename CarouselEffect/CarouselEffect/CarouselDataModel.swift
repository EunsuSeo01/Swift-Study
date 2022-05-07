//
//  CarouselData.swift
//  CarouselEffect
//
//  Created by 서은수 on 2022/05/08.
//

import Foundation

class CarouselDataModel {
    
    // Carousel cell에 들어갈 데이터 포맷 선언.
    struct CarouselData {
        let cellImagePath: String
        let cellLabel: String
    }
    
    // cell에 들어갈 데이터를 만들어서 배열에 넣는다.
    static let cellDataArray: [CarouselData] = [
        CarouselData(cellImagePath: "hello", cellLabel: "Hello there, i miss u"),
        CarouselData(cellImagePath: "bodyline", cellLabel: "Training like this, #bodyline"),
        CarouselData(cellImagePath: "dudu", cellLabel: "🐳🐳🐳🐳🐳"),
        CarouselData(cellImagePath: "wave", cellLabel: "I'm hungry, indeed."),
        CarouselData(cellImagePath: "run", cellLabel: "Run Run Run!"),
    ]
}
