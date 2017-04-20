//
//  MovieCell.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/20/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    // MARK: - Local Variables
    
    var titleLabel: UILabel!
    var profileImageView: UIImageView!
    //var dateLabel: UILabel!
    
    // MARK: - Extra Methods
    
    func commonInitCell() {
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
    
    // ino khodam neveshtam
    func configure(movie: Movie) {
        titleLabel.text = movie.title
        
        let url = URL(string: "https://www.apple.com/ac/structured-data/images/knowledge_graph_logo.png?201703170823")!
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        let image = UIImage(data: imageData)
                        self.profileImageView.image = image
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
        // set date later
    }
    
    // MARK: - Overriding Methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInitCell()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInitCell()
    }
    
    override func prepareForReuse() { // vaghti seda mishe k az safe raft birun va dobare mikhad biad tu safe
        super.prepareForReuse()
        
        profileImageView.image = nil
    }
    
}
