//
//  RedditPost.swift
//  RedditOS
//
//  Created by Riley Calkins on 11/4/17.
//  Copyright © 2017 Riley Calkins. All rights reserved.
//

import Foundation
import UIKit

class RedditPost:Codable{
    var id: String?
    var author: String?
    var title: String?
    var num_comments: Int?
    var ups: Int?
    var downs: Int?
    var url: String?

    var thumbnail:String?
    static let postThumbnailImageCache = NSCache<AnyObject, AnyObject>()
}

extension RedditPost {
    
    func loadThumbnail( completion: @escaping (UIImage?) -> Void ) -> Void {
        if let image = RedditPost.postThumbnailImageCache.object(forKey: self.thumbnail as AnyObject) as? UIImage {
            completion(image)
        }else if let _ = thumbnail {
            DispatchQueue.global().async {
                if let url = URL(string:self.thumbnail!), let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        RedditPost.postThumbnailImageCache.setObject(image, forKey: self.thumbnail as AnyObject)
                        DispatchQueue.main.async {
                            completion(image)
                        }
                    }else{
                        completion(nil)
                    }
                }else{
                    completion(nil)
                }
            }
        }else{
            completion(nil)
        }
    }
    
}
