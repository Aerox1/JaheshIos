//
//  ViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/7/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonClick(_ sender: Any) {
        if usernameTextField.text == "admin" && passwordTextField.text == "admin" {
            // show alert welcome to the club
            
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)

            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: { (action) in
                
                
                self.usernameTextField.text = "hello"
                
            }))
            self.present(alert, animated: true, completion: nil)
            
        }

    }
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        passwordTextField.isSecureTextEntry = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    
    
    
    

}

