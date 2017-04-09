//
//  LoginViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/7/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField = UITextField(frame: CGRect(x: 100, y: 100, width: 70, height: 50))
        usernameTextField.text = "test"
        view.addSubview(usernameTextField)
        
        loginButton = UIButton(frame: CGRect(x: 100, y: 170, width: 70, height: 50))
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.setTitle("Login", for: UIControlState.normal)
        loginButton.addTarget(self, action: #selector(LoginViewController.buttonClicked), for: .touchUpInside)
        
        view.addSubview(loginButton)
        
        
    }
    
    func buttonClicked() {
        
    }


}
