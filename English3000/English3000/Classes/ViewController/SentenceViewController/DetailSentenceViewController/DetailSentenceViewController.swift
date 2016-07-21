//
//  DetailSentenceViewController.swift
//  English3000
//
//  Created by HoangDuoc on 7/21/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class DetailSentenceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EventOfCellSentence {

    var arrSentences = Array<SentenceModel>()
    var topicId: String?
    @IBOutlet var tableDetail: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableDetail.registerNib(UINib(nibName: "DetailSentenceTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        self.tableDetail.rowHeight = UITableViewAutomaticDimension
        self.tableDetail.estimatedRowHeight = 63
        DatabaseManager().loadSentence("pattern", executyQuery: "select * from pattern where category_id = \(self.topicId!)") { (state, data) in
            if state {
                self.arrSentences = data as! Array<SentenceModel>
            }
        }
        // Do any additional setup after loading the view.
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
        return self.arrSentences.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as! DetailSentenceTableViewCell
        cell.tag = indexPath.row
        cell.delegate = self
        cell.lbSentence_en.text = self.arrSentences[indexPath.row].sentence_en
        cell.lbSentence_vi.text = self.arrSentences[indexPath.row].sentence_vi
        return cell
    }

    func handleEventDidTapSound(tag: Int) {
//        Constants().CreateTextToSpeech(self.arrSentences[tag].sentence_en!)
        let tabbar = self.navigationController?.tabBarController as! TabbarController
        tabbar.CreateTextToSpeech(self.arrSentences[tag].sentence_en!)
    }
    
    

}
