//
//  GitRefreshAndLoadMore.swift
//  AFNetworkingWithSwift
//
//  Created by vichhai on 7/21/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class GitRefreshAndLoadMore: NSObject {
   
    var tempFooterView : UIView!
    var moreFooterView : UIView!
    var imageIndex : Int!
    var tempHeaderView : UIView!
    var timer : NSTimer!
    var mainView = UIView()
    func addRefreshToTableView(tableView : UITableView,firstImageName:String) {
        
        // table temp header view/footer view
        
        tempHeaderView      = UIView(frame: CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.width, 12.0))
        tempHeaderView.backgroundColor = UIColor(red: 211, green: 214, blue: 219, alpha: 1)
        
        tableView.tableHeaderView = tempHeaderView;
        
        // for refresh
        var headerImage = UIImageView(frame: CGRectMake((UIScreen.mainScreen().bounds.width - 24.0) / 2, -28.0, 24.0, 27.0))
        headerImage.image   = UIImage(named: firstImageName)
        headerImage.backgroundColor = UIColor.clearColor()
        headerImage.tag     = 3001;
        tableView.addSubview(headerImage)
        
    }
    
    func addLoadMoreForTableView(tableView : UITableView,firstImageName:String) {
        
        tempFooterView      = UIView(frame: CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.width, 66.0))
        tempFooterView.backgroundColor = UIColor(red: 211, green: 214, blue: 219, alpha: 1)
        tableView.tableFooterView = tempFooterView;
        
        // for load more
        moreFooterView      =   UIView(frame: CGRectMake(0.0, 0.0, UIScreen.mainScreen().bounds.width, 66.0))
        moreFooterView.backgroundColor = UIColor(red: 211, green: 214, blue: 219, alpha: 1)
        var footerImage = UIImageView(frame: CGRectMake((UIScreen.mainScreen().bounds.width - 24.0) / 2, 6.0, 24.0, 27.0))
        footerImage.image   =   UIImage(named: firstImageName)
        footerImage.backgroundColor = UIColor.clearColor()
        footerImage.tag     = 3002
        moreFooterView.addSubview(footerImage)
    }
    
    func loopRefresh() {
        
        var imageArray = ["load_01.png","load_02.png","load_03.png","load_04.png","load_05.png","load_06.png"];
        var aImage = mainView.viewWithTag(3001) as! UIImageView
        
        aImage.image = UIImage(named: imageArray[imageIndex])
        imageIndex = imageIndex + 1
        
        if imageIndex == 6  {
            imageIndex = 0
        }
    }
    
    func loopLoadMore() {
        var imageArray = ["load_01.png","load_02.png","load_03.png","load_04.png","load_05.png","load_06.png"];
        var aImage = mainView.viewWithTag(3002) as! UIImageView
        
        aImage.image = UIImage(named: imageArray[imageIndex])
        imageIndex = imageIndex + 1
        
        if imageIndex == 6  {
            imageIndex = 0
        }
    }
    
    func changeImageWhenScrollDown(anyView : UIView,scrollView : UIScrollView) {
        var image = anyView.viewWithTag(3001) as! UIImageView
        
        if scrollView.contentOffset.y < -30 {
            image.image = UIImage(named: "load_01.png")
        }
        if scrollView.contentOffset.y < -35 {
            image.image = UIImage(named: "load_02.png")
        }
        if scrollView.contentOffset.y < -40 {
            image.image = UIImage(named: "load_03.png")
        }
        if scrollView.contentOffset.y < -45 {
            image.image = UIImage(named: "load_04.png")
        }
        if scrollView.contentOffset.y < -50 {
            image.image = UIImage(named: "load_05.png")
        }
        if scrollView.contentOffset.y < -55 {
            image.image = UIImage(named: "load_06.png")
        }
    }
    
    func doRefresh(tableView : UITableView,anyView:UIView) {
        mainView = anyView
        imageIndex = 0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "loopRefresh", userInfo: nil, repeats: true)
        tableView.contentInset = UIEdgeInsetsMake(45, 0, 0, 0)
    }
    
    func doLoadMore(anyView : UIView,tableView : UITableView,scrollView : UIScrollView) {
        mainView = anyView
        
        if (scrollView.contentOffset.y + UIScreen.mainScreen().bounds.size.height) >= scrollView.contentSize.height {
            if tableView.tableFooterView == moreFooterView {
                return;
            }
            tableView.tableFooterView = moreFooterView;
            imageIndex = 0
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "loopLoadMore", userInfo: nil, repeats: true)
        }
        
    }
    
    func temp(tableView : UITableView) {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
        
        if tableView.tableFooterView == moreFooterView {
            tableView.tableFooterView = tempFooterView
        }
    }
}
