//
//  PostsCollectionViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/13/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class PostsCollectionViewController: UIViewController {


    var collectionView: UICollectionView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        //flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.contentInset = .zero
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCollectionCell.self, forCellWithReuseIdentifier: "PostCollectionCell")
        //collectionView.register(NothingCell.self, forCellReuseIdentifier: "NothingCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        let collectionViewLayoutConstraint = [
            NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: collectionView.superview, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: collectionView.superview, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: collectionView.superview, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: collectionView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        ]
        view.addConstraints(collectionViewLayoutConstraint)
        
        let post = Post()
        post.date = Date()
        //if let image = UIImage(named: "profileImages") {
        // post.image = image
        //} else {
        //    post.image =
        //}
        
        post.image = UIImage(named: "profileImage") ?? UIImage() // in mosavie chand khat code balas
        
        post.title = "hello world"
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
        
        
    }
}
extension PostsCollectionViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionCell", for: indexPath) as! PostCollectionCell
        cell.configure(post: posts[indexPath.row])
        return cell
        
    }

    
}
extension PostsCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
}
