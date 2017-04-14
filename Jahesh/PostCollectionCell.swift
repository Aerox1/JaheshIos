//
//  PostCollectionCell.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/14/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class PostCollectionCell: UICollectionViewCell {
    
    
    var titleLabel: UILabel!
    var profileImageView: UIImageView!
    
    func commonInit() {
        
        profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
        
        let profileImageViewConstraints = [
            NSLayoutConstraint(item: profileImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: profileImageView, attribute: .trailing, relatedBy: .equal, toItem: profileImageView.superview, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: profileImageView, attribute: .top, relatedBy: .equal, toItem: profileImageView.superview, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: profileImageView, attribute: .bottom, relatedBy: .equal, toItem: profileImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        ]
        addConstraints(profileImageViewConstraints)
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .right
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        let titleLabelConstraints = [
            NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: titleLabel.superview, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: profileImageView, attribute: .leading, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel.superview, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: titleLabel.superview, attribute: .bottom, multiplier: 1, constant: 0)
            
        ]
        addConstraints(titleLabelConstraints)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }
    
    
    func configure(post: Post) {
        titleLabel.text = post.title
        profileImageView.image = post.image
        // set date later
    }
}
