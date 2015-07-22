//
//  TestingCollectionViewController.swift
//  AFNetworkingWithSwift
//
//  Created by vichhai on 7/22/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

let reuseIdentifier = "collCell"

class TestingCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
     let titles = ["Sand Harbor, Lake Tahoe - California","Beautiful View of Manhattan skyline.","Watcher in the Fog","Great Smoky Mountains National Park, Tennessee","Most beautiful place"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = UIColor.lightGrayColor()
        title = "Pinterest"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Collection view datasource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.title.text = titles[indexPath.row % 5]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSize(width: 145, height: 300)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

}
