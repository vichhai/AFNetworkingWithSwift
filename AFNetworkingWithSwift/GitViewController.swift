//
//  GitViewController.swift
//  AFNetworkingWithSwift
//
//  Created by vichhai on 7/20/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

//public let stringURl : String = "http://icodingkh.com/server/server.php?SubID=1&Start=0&NumRec=9"
public let stringURl : String = "http://api.openweathermap.org"
import UIKit

protocol GitDelegate {
    func returnResult(arrayResult : AnyObject)
    func returnWithError(error : NSError)
}

class GitViewController: UIViewController {

    var delegate : GitDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func sendTranData(apiKey : String , withParamether : NSDictionary?) {
        
        let manager = AFHTTPRequestOperationManager(baseURL: NSURL(string: apiKey))
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        
        manager.POST("/data/2.5/weather?", parameters: withParamether,
                success: { (operation : AFHTTPRequestOperation,response: AnyObject) -> Void in
                    
                    self.delegate.returnResult(response)
                    println(withParamether)
                    println(operation)
                })
                { (operation:AFHTTPRequestOperation, error : NSError) -> Void in
                    //                        self.delegate.returnWithError(error)
                    println(error)
        }
        
    }
}
