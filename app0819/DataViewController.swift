//
//  DataViewController.swift
//  app0819
//
//  Created by Natsumi Uda on 2015/08/28.
//  Copyright (c) 2015年 Natsumi Uda. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    var mUrl:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var wv = UIWebView(frame: UIScreen.mainScreen().bounds)
        self.view.addSubview(wv)
        
        wv.loadRequest(NSURLRequest(URL: NSURL(string: mUrl)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
