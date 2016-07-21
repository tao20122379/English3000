//
//  WordViewController.swift
//  English3000
//
//  Created by HoangDuoc on 7/20/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class WordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrWords = Array<WordModel>()
    
    @IBOutlet var tableWord: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableWord.registerNib(UINib(nibName: "WordTableViewCell", bundle: nil), forCellReuseIdentifier: "wordCell")
        self.tableWord.rowHeight = UITableViewAutomaticDimension
        self.tableWord.estimatedRowHeight = 95
        DatabaseManager().loadWord("db", executyQuery: "select * from word") { (state, data) in
            if state {
                self.arrWords = data as! Array<WordModel>
            }
        }
        
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

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrWords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("wordCell", forIndexPath: indexPath) as! WordTableViewCell
        cell.lbName.text = self.arrWords[indexPath.row].name
        cell.lbRead.text = self.arrWords[indexPath.row].read
        cell.lbCategory.text = self.arrWords[indexPath.row].category
        cell.lbViContent.text = self.arrWords[indexPath.row].vicontent

        return cell
    }
}
