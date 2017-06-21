//
//  FeedViewController.swift
//  ReviewGrayGram
//
//  Created by Sunny Jeong on 2017. 6. 18..
//  Copyright © 2017년 Sunny Jeong. All rights reserved.
//

import UIKit
import Alamofire

class FeedViewController: UIViewController {

    fileprivate let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        
        collectionView.backgroundColor = .gray
        
        // register Post card cell
        
        //collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        //collectionView.dataSource = self
        //collectionView.delegate = self
        
        self.view.addSubview(collectionView)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

