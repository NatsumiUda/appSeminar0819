//
//  ViewController.swift
//  app0819
//
//  Created by Natsumi Uda on 2015/08/27.
//  Copyright (c) 2015年 Natsumi Uda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Tableで使用する配列を設定する
    var qiitaList:[[String:String]] = []
    var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // QiitaのAPIから情報取得
        var myUrl:NSURL = NSURL(string:"https://qiita.com/api/v2/items")!
        var myRequest:NSURLRequest  = NSURLRequest(URL: myUrl)
        NSURLConnection.sendAsynchronousRequest(myRequest, queue: NSOperationQueue.mainQueue(), completionHandler: self.getJson)
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: UIScreen.mainScreen().bounds)
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    Qiitaのデータを配列へ入れる
    */
    func getJson(res:NSURLResponse?,data:NSData?,error:NSError?){
        // 受け取ったJSONデータをパースする.
        var json:NSArray = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSArray
        for data in json{
            qiitaList.append(["title":data["title"] as! String, "url":data["url"] as! String])
        }
        
        myTableView.reloadData()
    }
    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Num: \(indexPath.row)")
        
        var vc = DataViewController()
        vc.mUrl = qiitaList[indexPath.row]["url"]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiitaList.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Cellに値を設定する.
        cell.textLabel!.text = qiitaList[indexPath.row]["title"]
        
        return cell
    }
    
}


