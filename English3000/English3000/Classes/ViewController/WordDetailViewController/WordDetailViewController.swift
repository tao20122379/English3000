//
//  WordDetailViewController.swift
//  English3000
//
//  Created by khactao on 7/21/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class WordDetailViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource{

    // MARK: - IBoutlet and variable
    @IBOutlet var wordLineTableView: UITableView!
    var wordModel: WordModel?
    var wordDetailList: [String] = []
    
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.getWordDetail()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingTableView()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Call sqlite
    func getWordDetail() {
        WordDetailServices.getWordDetail(self.wordModel!) { (stats, data) in
            self.wordDetailList = data as! [String]
        }
    }
    
    
    // MARK: - TableView
    func settingTableView() {
    self.wordLineTableView.delegate = self
    self.wordLineTableView.dataSource = self
    self.wordLineTableView.registerNib(UINib(nibName: "WordLineCell", bundle: nil), forCellReuseIdentifier: "WordLineCell")
    self.wordLineTableView.rowHeight = UITableViewAutomaticDimension
    self.wordLineTableView.estimatedRowHeight = 10
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.wordDetailList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WordLineCell") as! WordLineCell
        cell.initWithTitle(self.wordDetailList[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil).first as! HeaderView
        headerView.nameLabel.text = self.wordModel?.name
        return headerView
    }

}
