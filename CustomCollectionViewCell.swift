//
//  CustomTableViewCell.swift
//  RedditOS
//
//  Created by Riley Calkins on 11/3/17.
//  Copyright © 2017 Riley Calkins. All rights reserved.
//

import Foundation
import UIKit

class CustomCollectionViewCell:UICollectionViewCell{
    
    var stackedPostView:UIStackView!
    var stackedDetailsView:UIStackView!
    var stackedInfoView:UIStackView!
    
    
    let container:UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 100))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cellBackgroundImageView:UIView = {
        let view = UIView()
        let backgroundImage = #imageLiteral(resourceName: "background")
        let imageView = UIImageView(image: backgroundImage)
        view.addSubview(imageView)
        return view
    }()
    
    let profilePicture:UIImageView = {
        let customBlue : UIColor = UIColor(red: 72.0/255.0, green: 181.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.layer.borderWidth = 3
        image.layer.borderColor = customBlue.cgColor
        image.clipsToBounds = true
        image.setContentHuggingPriority(UILayoutPriority(100), for: .horizontal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let usernameLabel: UILabel = {
        let customBlue : UIColor = UIColor(red: 72.0/255.0, green: 181.0/255.0, blue: 252.0/255.0, alpha: 1.0)
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.text = "Username Test"
        label.textColor = customBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.textColor = .black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Comments, Upvotes, Downvotes Labels
    let commentsLabel: UILabel = {
        let customDarkGrey: UIColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let label = UILabel()
        label.text = "Comments: 0"
        label.backgroundColor = .white
        label.textColor = customDarkGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority(200), for: .horizontal)
        return label
    }()
    let upvotesLabel: UILabel = {
        let customDarkGrey: UIColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let label = UILabel()
        label.textColor = customDarkGrey
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(UILayoutPriority(201), for: .horizontal)
        return label
    }()
    let downvotesLabel: UILabel = {
        let customDarkGrey: UIColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let label = UILabel()
        label.text = "Downvotes: 0"
        label.textColor = customDarkGrey
        label.backgroundColor = .white
        label.setContentHuggingPriority(UILayoutPriority(202), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackBackgroundImageView: UIView = {
        let view = UIView()
        let image: UIImage = UIImage(named: "stackImage")!
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //self.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    func setupViews(){

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        
        var font = UIFont(name: "Avenir-Light", size: 14.0)!
        font = UIFont.systemFont(ofSize: 14)
        
        commentsLabel.font = font
        upvotesLabel.font = font
        downvotesLabel.font = font
        
        //stackedInfoView Wrapper
        let stackedInfoViewWrapper:UIView = UIView()
        stackedInfoViewWrapper.translatesAutoresizingMaskIntoConstraints = false
        
        stackedInfoView = UIStackView(arrangedSubviews: [commentsLabel, upvotesLabel, downvotesLabel])
        stackedInfoView.axis = .horizontal
        stackedInfoView.distribution = .fillProportionally
        stackedInfoView.alignment = .fill
        stackedInfoView.spacing = 15.0
        stackedInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        //textLabel Wrapper
        let textWrapper:UIView = UIView()
        textWrapper.translatesAutoresizingMaskIntoConstraints = false
        
        stackedDetailsView = UIStackView(arrangedSubviews: [usernameLabel,textWrapper, stackedInfoViewWrapper])
        stackedDetailsView.axis = .vertical
        stackedDetailsView.distribution = .fill
        stackedDetailsView.alignment = .fill
        stackedDetailsView.spacing = 8.0
        stackedDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        textWrapper.trailingAnchor.constraint(equalTo: stackedDetailsView.trailingAnchor).isActive = true
        textWrapper.leadingAnchor.constraint(equalTo: stackedDetailsView.leadingAnchor).isActive = true
        textWrapper.addSubview(textLabel)
        
        //textWrapper.backgroundColor = UIColor.green
        textLabel.topAnchor.constraint(equalTo: textWrapper.topAnchor, constant: 0).isActive = true
        textLabel.leftAnchor.constraint(equalTo: textWrapper.leftAnchor, constant: 0).isActive = true
        textLabel.rightAnchor.constraint(equalTo: textWrapper.rightAnchor, constant: 0).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: textWrapper.bottomAnchor, constant: 0).isActive = true
        
//        stackedInfoViewWrapper.addSubview(stackBackgroundImageView)
        stackedInfoViewWrapper.addSubview(stackedInfoView)
        
        //stackedInfoViewWrapper.backgroundColor = UIColor.brown
        stackedInfoViewWrapper.trailingAnchor.constraint(equalTo: stackedDetailsView.trailingAnchor).isActive = true
    
        stackedInfoViewWrapper.leadingAnchor.constraint(equalTo: stackedDetailsView.leadingAnchor).isActive = true
        
        
        
        stackedInfoView.topAnchor.constraint(equalTo: stackedInfoViewWrapper.topAnchor, constant: 0).isActive = true
        stackedInfoView.leftAnchor.constraint(equalTo: stackedInfoViewWrapper.leftAnchor, constant: 0).isActive = true
        stackedInfoView.rightAnchor.constraint(equalTo: stackedInfoViewWrapper.rightAnchor, constant: 0).isActive = true
        stackedInfoView.bottomAnchor.constraint(equalTo: stackedInfoViewWrapper.bottomAnchor, constant: 0).isActive = true
        
        
//        stackBackgroundImageView.topAnchor.constraint(equalTo: stackedInfoView.topAnchor, constant: 0).isActive = true
//        stackBackgroundImageView.leftAnchor.constraint(equalTo: stackedInfoView.leftAnchor, constant: 0).isActive = true
//        stackBackgroundImageView.rightAnchor.constraint(equalTo: stackedInfoView.rightAnchor, constant: 0).isActive = true
//        stackBackgroundImageView.heightAnchor.constraint(equalTo: stackedInfoView.heightAnchor, constant: 0).isActive = true

        let pictureWrapper:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 96, height: 96))
        pictureWrapper.translatesAutoresizingMaskIntoConstraints = false
        
        stackedPostView = UIStackView(arrangedSubviews: [pictureWrapper, stackedDetailsView])
        stackedPostView.setContentHuggingPriority(UILayoutPriority(199), for: .horizontal)
        stackedPostView.axis = .horizontal
        stackedPostView.distribution = .fillProportionally
        stackedPostView.alignment = .top
        stackedPostView.spacing = 8.0
        stackedPostView.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(stackedPostView)
//        contentView.addSubview(cellBackgroundImageView)
        contentView.addSubview(container)
        

        //container.backgroundColor = UIColor.cyan
        
//        cellBackgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        cellBackgroundImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        cellBackgroundImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
//        cellBackgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        container.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        stackedPostView.topAnchor.constraint(equalTo: container.topAnchor, constant:0).isActive = true
        stackedPostView.leftAnchor.constraint(equalTo: container.leftAnchor, constant:0).isActive = true
        stackedPostView.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 0).isActive = true
        stackedPostView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        
//        profilePictureWrapper
        pictureWrapper.addSubview(profilePicture)
        //pictureWrapper.backgroundColor = UIColor.red
        pictureWrapper.widthAnchor.constraint(equalToConstant: 96.0).isActive = true
        pictureWrapper.heightAnchor.constraint(equalToConstant: 96.0).isActive = true
        profilePicture.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        profilePicture.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        profilePicture.centerXAnchor.constraint(equalTo: pictureWrapper.centerXAnchor, constant: 0).isActive = true
        profilePicture.centerYAnchor.constraint(equalTo: pictureWrapper.centerYAnchor, constant: 0).isActive = true

    }

    
    //comment upvotes downvote
    func fillCell(with post:RedditPost) {
        usernameLabel.text = post.author ?? "no author"
        textLabel.text = post.title ?? "no title"
        commentsLabel.text = "\(post.num_comments ?? 0) Comments"
        upvotesLabel.text = "\(post.ups ?? 0) Ups"
        downvotesLabel.text = "\(post.downs ?? 0) Downs"
        
        self.profilePicture.backgroundColor = .white
        post.loadThumbnail { image in
            self.profilePicture.image = image
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
}
