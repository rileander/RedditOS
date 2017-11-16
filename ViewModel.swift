//
//  ViewModel.swift
//  RedditOS
//
//  Created by Riley Calkins on 11/3/17.
//  Copyright © 2017 Riley Calkins. All rights reserved.
//
//
import Foundation
import UIKit

protocol VMDelegate:class{
    func updateCollectionView()
}

class ViewModel{
    static var postArray:[RedditPost] = [RedditPost]()
    static var vmDelegate: VMDelegate?
    
    static func searchPosts(with text:String){
        Networking.searchWithText(with: text){ posts in
            postArray = posts!
            DispatchQueue.main.async {
                vmDelegate?.updateCollectionView()
            }
        }
    }
}

