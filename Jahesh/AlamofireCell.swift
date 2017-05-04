//
//  AlamofireCell.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/21/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class AlamofireCell: UITableViewCell {
    
    var profileImage: UIImageView!
    var label: UITextView!
    var likeButton: UIButton!
    var delegate: AlamofireCellDelegate!
    var id: Int!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInitCell()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInitCell()
    }
    
    func commonInitCell() {
        profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImage)
        
        label = UITextView()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        likeButton = UIButton()
        likeButton.addTarget(self, action: #selector(likeClicked), for: .touchUpInside)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(likeButton)
        
        let profileImageConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: profileImage, attribute: .centerX, relatedBy: .equal, toItem: profileImage.superview, attribute: .centerX, multiplier: 1, constant: 0)
            , NSLayoutConstraint(item: profileImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
            , NSLayoutConstraint(item: profileImage, attribute: .top, relatedBy: .equal, toItem: profileImage.superview, attribute: .top, multiplier: 1, constant: 10)
            , NSLayoutConstraint(item: profileImage, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        ]
        addConstraints(profileImageConstraints)
        
        let labelConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: label.superview, attribute: .centerX, multiplier: 1, constant: 0)
            , NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
            , NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: profileImage, attribute: .bottom, multiplier: 1, constant: 10)
            , NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        ]
        addConstraints(labelConstraints)
        
        let likeButtonConstraints: [NSLayoutConstraint] = [
            NSLayoutConstraint(item: likeButton, attribute: .leading, relatedBy: .equal, toItem: likeButton.superview, attribute: .leading, multiplier: 1, constant: 10)
            , NSLayoutConstraint(item: likeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
            , NSLayoutConstraint(item: likeButton, attribute: .bottom, relatedBy: .equal, toItem: likeButton.superview, attribute: .bottom, multiplier: 1, constant: -10)
            , NSLayoutConstraint(item: likeButton, attribute: .height, relatedBy: .lessThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ]
        addConstraints(likeButtonConstraints)
        
    }
    
    func likeClicked() {
        likeButton.setImage(UIImage(named: "likeSelected"), for: .normal)
        delegate.likeButtonClicked(id: id)
    }
    
    func configure(movie: Movie) {
        likeButton.setImage(UIImage(named: "likeDeselect"), for: .normal)
        label.text = movie.title
        id = movie.id
        //profileImage.image =
    }
    
}
