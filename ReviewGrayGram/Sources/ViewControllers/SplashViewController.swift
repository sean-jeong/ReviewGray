//
//  SplashViewController.swift
//  ReviewGrayGram
//
//  Created by Sean Jeong on 27/06/2017.
//  Copyright © 2017 Sunny Jeong. All rights reserved.
//

import UIKit

import Alamofire

final class SplashViewController: UIViewController {
    
    
    fileprivate let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
      super.viewDidLoad()
      self.view.addSubview(activityIndicatorView)
      activityIndicatorView.snp.makeConstraints { make in
        make.center.equalToSuperview()
      }
        
      activityIndicatorView.startAnimating()
    }
    
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let urlString = "https://api.graygram.com/me"
    Alamofire.request(urlString)
      .validate(statusCode: 200..<400)
      .responseJSON { response in
        switch response.result {
        case .success(let value): // 로그인되어 있는 경우 
          print("내 프로필 정보 받아오기 성공 \(value)")
          AppDelegate.instance?.presentMainScreen()
        case .failure(let error):
          print("내 프로필 정보 받아오기 실피 \(error)")
          AppDelegate.instance?.presentLoginScreen()
        }
    
      }
    
  }
    
}

