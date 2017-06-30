//
//  LoginViewController.swift
//  ReviewGrayGram
//
//  Created by Sean Jeong on 28/06/2017.
//  Copyright © 2017 Sunny Jeong. All rights reserved.
//

import UIKit
import Alamofire

final class LoginViewController: UIViewController {
  
  fileprivate let usernameTextField = UITextField()
  fileprivate let passwordTextField = UITextField()
  fileprivate let loginButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    self.view.addSubview(usernameTextField)
    self.view.addSubview(passwordTextField)
    self.view.addSubview(loginButton)
    
    usernameTextField.borderStyle = .roundedRect
    usernameTextField.placeholder = "Username"
    usernameTextField.autocorrectionType = .no
    usernameTextField.autocapitalizationType = .none
    usernameTextField.addTarget(self, action: #selector(textFieldDidChangeText), for: .editingChanged)
    
    passwordTextField.borderStyle = .roundedRect
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    passwordTextField.addTarget(self, action: #selector(textFieldDidChangeText), for: .editingChanged)
    
    loginButton.setTitle("Login", for: .normal)
    loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    loginButton.backgroundColor = loginButton.tintColor
    loginButton.layer.cornerRadius = 5
    loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    
    usernameTextField.snp.makeConstraints { make in
      make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(30)
      make.left.equalTo(30)
      make.right.equalTo(-30)
      make.height.equalTo(30)
    }
    
    passwordTextField.snp.makeConstraints { make in
      make.top.equalTo(usernameTextField.snp.bottom).offset(30)
      make.left.right.height.equalTo(usernameTextField)
      
    }
    
  }
  
  func loginButtonDidTap() {
    guard let username = usernameTextField.text, !username.isEmpty else { return }
    guard let password = passwordTextField.text, !password.isEmpty else { return }
    login(username: username, password: password)
  }
  
  func login(username: String, password: String) {
    let urlString = "https://api.graygram.com/login/username"
    let parameters: Parameters = [
      "username": username,
      "password": password,
    ]
    let headers: HTTPHeaders = [
      "Accept": "application/json",
    ]
    
    usernameTextField.isEnabled = false
    usernameTextField.alpha = 0.4
    passwordTextField.isEnabled = false
    passwordTextField.alpha = 0.4
    loginButton.isEnabled = false
    loginButton.alpha = 0.4
    
    Alamofire
      .request(urlString, method: .post, parameters: parameters, headers: headers)
      .validate(statusCode: 200..<400)
      .responseJSON { response in
        self.usernameTextField.isEnabled = true
        self.usernameTextField.alpha = 1
        self.passwordTextField.isEnabled = true
        self.passwordTextField.alpha = 1
        self.loginButton.isEnabled = true
        self.loginButton.alpha = 1
        
        switch response.result {
        case .success(let value):
          print("로그인성공! \(value)")
          AppDelegate.instance?.presentMainScreen()
          
        case .failure(let error):
          print("로그인실패 \(error)")
          
        }
      }
    
    
    
    
    
  }
  
  func textFieldDidChangeText(_ textField: UITextField) {
    UIView.animate(withDuration: 1) {
      textField.backgroundColor = .white
    }
  }
  
  
}
