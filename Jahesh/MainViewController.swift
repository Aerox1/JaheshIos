//
//  MainViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/13/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileImage"), tag: 1)
        
        let profileViewController2 = LoginViewController()
        profileViewController2.tabBarItem = UITabBarItem(title: "Profile2", image: UIImage(named: "profileImage"), tag: 1)

        viewControllers = [profileViewController, profileViewController2]
    }
    
    
}

