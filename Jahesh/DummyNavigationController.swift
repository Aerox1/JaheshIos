//
//  DummyNavigationController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/13/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit




// LoginViewCOntroller ----->(present) DummyNavigationCOntroller ----> (ke tush ProfileViewCOntroller hast) -----> (LoginClick k kard) (push mikone tu DummyNavigationCOntrooller chio ?? ) ----> ProfileViewCOntroller
class DummyNavigationController: UINavigationController {
    
    
    var usernameTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewControllers = [ProfileViewController()]
    }
    
    
}
