//
//  MainViewController.swift
//  AFNetworkingWithSwift
//
//  Created by vichhai on 7/20/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class MainViewController: GitViewController,GitDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    var refreshAndLoadMore = GitRefreshAndLoadMore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var requestDic = Dictionary<String,String>()
//        requestDic["id"] = "2172797"

        let manager = AFHTTPRequestOperationManager()
        self.delegate = self
        
        /* For header and footer table view*/
        mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        setupView()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func returnWithError(error: NSError) {
        
        println(error)
    }
    
    func returnResult(arrayResult: AnyObject) {
//        mainTableView.contentInset = UIEdgeInsetsZero
        println(arrayResult)
    }
    
    
    //MARK: - tableview datasource 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    //MARK: - Refresh / Load more
    
    func setupView() {
        
        // adding refresh for maintableView
        refreshAndLoadMore.addRefreshToTableView(mainTableView,firstImageName: "load_01.png")
        
    }
    
    //MARK: - scroll view delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        refreshAndLoadMore.changeImageWhenScrollDown(self.view, scrollView: scrollView)
    }
    
    // scroll up
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        refreshAndLoadMore.doRefresh(mainTableView, anyView: self.view)
        var requestDic = Dictionary<String,String>()
        requestDic["id"] = "2172797"
        super.sendTranData(stringURl, withParamether: requestDic)
    }
    
    // scroll down
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

    }
    
}
