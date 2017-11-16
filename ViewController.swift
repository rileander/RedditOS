//
//  ViewController.swift
//  RedditOS
//
//  Created by Riley Calkins on 11/2/17.
//  Copyright © 2017 Riley Calkins. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
 
    var myToolBar: UIToolbar!
    var mySearchBar: UISearchBar!
    var collectionView: UICollectionView!
    let cellID = "cellId"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModel.searchPosts(with: "funny")
        
        // make UISearchBar instance
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRect(x: 0, y: 0, width: 300, height: 80)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 100)
        mySearchBar.layer.shadowColor = UIColor.black.cgColor
        mySearchBar.layer.shadowOpacity = 0.5
        mySearchBar.layer.masksToBounds = false
        mySearchBar.showsCancelButton = false
        mySearchBar.showsBookmarkButton = false
        mySearchBar.searchBarStyle = UISearchBarStyle.prominent
        mySearchBar.placeholder = "Input text"
        mySearchBar.tintColor = UIColor.red
        mySearchBar.showsSearchResultsButton = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        //layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: self.view.frame.width, height: 1)
        //layout.estimatedItemSize.width = self.view.frame.width
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .gray
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(collectionView!)
        view.addSubview(mySearchBar)
        
        mySearchBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        mySearchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant:20).isActive = true
        mySearchBar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:0).isActive = true
        mySearchBar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant:0).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: mySearchBar.bottomAnchor, constant:0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant:0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:0).isActive = true
        
    }
    
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: view.frame.width, height:130)
//        return size
//    }
//
    func composeUrl(with text: String) -> String{
        let urlString:String = "http://www.reddit.com/r/\(text)/.json"
        return urlString
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = ViewModel.postArray.count
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCollectionViewCell
        
        cell.fillCell(with: ViewModel.postArray[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected: \(indexPath.section)")
    }
}
extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil && searchBar.text != ""{
            ViewModel.searchPosts(with: searchBar.text!)
            searchBar.endEditing(true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            print(searchText)
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
}

extension ViewController:VMDelegate{
    func updateCollectionView() {
        
        collectionView?.reloadData()
    }
}





