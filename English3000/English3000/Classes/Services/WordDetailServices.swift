//
//  WordDetailServices.swift
//  English3000
//
//  Created by khactao on 7/21/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import UIKit

class WordDetailServices: NSObject {
    
    class func getWordDetail(word: WordModel, completionHandler: CompletionHandler) {
        
        let searchKey = "@"+word.name+" /"+Constants().stringReplaces(word.read!, key: ["[", "]"])+"/"
        
        DatabaseManager().queryDatabase("dictd_anh_viet", executyQuery: "SELECT * FROM EVDictionary WHERE meaning LIKE \"%" + searchKey + "%\"") { (status, data) in
            
            let rs = data as! FMResultSet
            while rs.next() {
                
                let wordDtails: [String] = Constants().formatWordDetail(rs.stringForColumn("meaning"))
                completionHandler(true, wordDtails)
                
            }
            
        }
    }
}


