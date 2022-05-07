//
//  ViewController.swift
//  CarouselEffect
//
//  Created by 서은수 on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let cellDataArray = CarouselDataModel.cellDataArray
    
    // MARK: - Subviews
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // attributes 설정.
        setupAttributes()
        // delegate 설정.
        setupDelegate()
        
        // 셀 파일 설정.
        collectionView.register(
            UINib(nibName: "CustomCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }

    // MARK: - Functions
    
    // attributes 설정.
    func setupAttributes() {
        collectionView.backgroundColor = .none
    }
    
    // delegate 설정.
    func setupDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Collection view cell의 갯수 설정.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellDataArray.count
    }
    
    // Collection view cell의 내용 설정.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // CustomCollectionViewCell 타입의 cell 생성.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as! CustomCollectionViewCell
        
        // cell의 이미지와 레이블 텍스트 설정.
        cell.cellImageView.image = UIImage(named: cellDataArray[indexPath.item].cellImagePath)
        cell.cellLabel.text = cellDataArray[indexPath.item].cellLabel
        
        return cell
    }
}
