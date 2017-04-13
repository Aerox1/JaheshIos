//
//  LoginWithConstraintsViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/13/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var nameLabel: UILabel!
    var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.text = "Ali"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        image = UIImageView()
        image.image = UIImage(named: "profileImage") // tuye asset ha tarif kardam
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        
        let nameLabelConstraints: [NSLayoutConstraint] = [
        NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel.superview, attribute: .top, multiplier: 1, constant: 30)
            , NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: nameLabel.superview, attribute: .centerX, multiplier: 1, constant: 0)
            , NSLayoutConstraint(item: nameLabel, attribute: .width, relatedBy: .lessThanOrEqual, toItem: nameLabel.superview, attribute: .width, multiplier: 1, constant: 0)
            , NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40) // vase inke meghdare constant bashe
            
        ]
        view.addConstraints(nameLabelConstraints)
        
        let imageConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: image, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .top, multiplier: 1, constant: 0)
            , NSLayoutConstraint(item: image, attribute: .leading, relatedBy: .equal, toItem: image.superview, attribute: .leading, multiplier: 1, constant: 0)
            //, NSLayoutConstraint(item: image, attribute: .width, relatedBy: .lessThanOrEqual, toItem: image.superview, attribute: .width, multiplier: 1, constant: 0) // halate wrap_content android ro dare
            //, NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40) // vase inke meghdare constant bashe
            
        ]
        view.addConstraints(imageConstraints)
        
    }
    
    
}
