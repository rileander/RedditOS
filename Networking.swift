//
//  Networking.swift
//  CapitalOneApp
//
//  Created by Riley Calkins on 9/18/17.
//  Copyright © 2017 Riley Calkins. All rights reserved.
//

import UIKit

class Networking{
    
    static func searchWithText(with searchText: String = "funny", completion: @escaping ([RedditPost]?) -> Void) {
        
        var postArray:[RedditPost] = [RedditPost]()
        let urlString:String = "https://www.reddit.com/r/\(searchText)/.json"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                print("error block")
                completion(nil)
                
            }else{
                // |
                // V Parsing Starts Here V
                let decodedResponse = try! JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue:0)) as? [String: AnyObject]
                let decoder = JSONDecoder()
                
                if let responseData = decodedResponse!["data"] as? [String: Any]{
                    if let secondResponseData = responseData["children"] as? [[String: Any]] {
                        for element in secondResponseData {
                            let elementData = element["data"] as? [String: Any]
                            let serializationData = try! JSONSerialization.data(withJSONObject: elementData, options: .prettyPrinted)
                            let post = try! decoder.decode(RedditPost.self, from:  serializationData)
                            postArray.append(post)
                        }
                    }
                }
                completion(postArray)
                
            }
        }
        task.resume()
    }
}

