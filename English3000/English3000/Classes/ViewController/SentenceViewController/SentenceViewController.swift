//
//  SentenceViewController.swift
//  English3000
//
//  Created by HoangDuoc on 7/20/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class SentenceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrTopic = Array<TopicModel>()
    
    @IBOutlet var tableSentence: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableSentence.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        DatabaseManager().loadTopic("pattern", executyQuery: "select * from pattern_category") { (state, data) in
            if state {
                self.arrTopic = data as! Array<TopicModel>
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
        return self.arrTopic.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel!.text = self.arrTopic[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailSentenceViewController(nibName: "DetailSentenceViewController", bundle: nil)
        detailVC.topicId = self.arrTopic[indexPath.row].id
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
