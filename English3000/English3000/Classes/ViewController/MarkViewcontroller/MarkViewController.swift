//
//  MarkViewController.swift
//  English3000
//
//  Created by HoangDuoc on 7/20/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class MarkViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, EventOfCell {
    
    @IBOutlet var tableMark: UITableView!
    var arrWords = Array<WordModel>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableMark.registerNib(UINib(nibName: "WordTableViewCell", bundle: nil), forCellReuseIdentifier: "markCell")
        self.tableMark.rowHeight = UITableViewAutomaticDimension
        self.tableMark.estimatedRowHeight = 95
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        DatabaseManager().loadWord("db", executyQuery: "select * from word where state = 1") { (state, data) in
            if state {
                self.arrWords = data as! Array<WordModel>
                self.tableMark.reloadData()
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrWords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("markCell", forIndexPath: indexPath) as! WordTableViewCell
        cell.tag = indexPath.row
        cell.delegate = self
        cell.lbName.text = self.arrWords[indexPath.row].name
        cell.lbRead.text = self.arrWords[indexPath.row].read
        cell.lbCategory.text = self.arrWords[indexPath.row].category
        cell.lbViContent.text = self.arrWords[indexPath.row].vicontent
        if self.arrWords[indexPath.row].state == "0" {
            cell.btStar.setImage(UIImage(named: "favorite"), forState: .Normal)
        }else {
            cell.btStar.setImage(UIImage(named: "favorite-select"), forState: .Normal)
        }
        
        return cell
    }
    
    func handleEventDidTapSound(tag: Int) {
        let tabbar = self.navigationController?.tabBarController as! TabbarController
        tabbar.CreateTextToSpeech(self.arrWords[tag].name)
    }
    
    func handleEventDidTapStar(cell: UITableViewCell) {
        let indexPath = self.tableMark.indexPathForCell(cell as! WordTableViewCell)
        DatabaseManager().updateDatabase("db", executyQuery: "update word set state = '0' where _id = \(self.arrWords[(indexPath?.row)!].id )")
        self.arrWords.removeAtIndex((indexPath?.row)!)
        self.tableMark.beginUpdates()
        self.tableMark.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Left)
        self.tableMark.endUpdates()
        
    }
    
    
    
}
