//
//  WordViewController.swift
//  English3000
//
//  Created by HoangDuoc on 7/20/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class WordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EventOfCell {

    var arrWords = Array<WordModel>()
    
    @IBOutlet var tableWord: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableWord.registerNib(UINib(nibName: "WordTableViewCell", bundle: nil), forCellReuseIdentifier: "wordCell")
        self.tableWord.rowHeight = UITableViewAutomaticDimension
        self.tableWord.estimatedRowHeight = 95
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        DatabaseManager().loadWord("db", executyQuery: "select * from word") { (state, data) in
            if state {
                self.arrWords = data as! Array<WordModel>
                self.tableWord.reloadData()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("wordCell", forIndexPath: indexPath) as! WordTableViewCell
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
    
    // MARK: - handle event of cell

    func handleEventDidTapSound(cell: UITableViewCell) {
        let indexPath = self.tableWord.indexPathForCell(cell as! WordTableViewCell)
        let tabbar = self.navigationController?.tabBarController as! TabbarController
        tabbar.CreateTextToSpeech(self.arrWords[indexPath!.row].name)
    }
    
    func handleEventDidTapStar(cell: UITableViewCell) {
        let indexPath = self.tableWord.indexPathForCell(cell as! WordTableViewCell)

        if self.arrWords[indexPath!.row].state == "0" {
            DatabaseManager().updateDatabase("db", executyQuery: "update word set state = '1' where _id = \(indexPath!.row + 1)")
            self.arrWords[indexPath!.row].state = "1"
        }else {
            DatabaseManager().updateDatabase("db", executyQuery: "update word set state = '0' where _id = \(indexPath!.row + 1)")
            self.arrWords[indexPath!.row].state = "0"
        }
    }
    
}
