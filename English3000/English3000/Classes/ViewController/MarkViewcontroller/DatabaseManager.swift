//
//  DatabaseManager.swift
//  English3000
//
//  Created by HoangDuoc on 7/20/16.
//  Copyright © 2016 khactao. All rights reserved.
//

import Foundation


class DatabaseManager {
    
    func queryDatabase(dbName: String,executyQuery: String, completionHandler: CompletionHandler) {
        let sourcePath = NSBundle.mainBundle().pathForResource(dbName, ofType: "sqlite")
        let database = FMDatabase(path: sourcePath)
        if !database.open() {
            print("Unable to open database")
            return
        }
        do {
            let resultDatas = try database.executeQuery(executyQuery, values: nil)
//            var resultDatas = Array<WordModel>()
//            while rs.next() {
//                let word = WordModel()
//                word.id = rs.stringForColumn("_id")
//                word.name = rs.stringForColumn("name")
//                word.category = rs.stringForColumn("category")
//                word.read = rs.stringForColumn("read")
//                word.vicontent = rs.stringForColumn("vicontent")
//                word.isread = rs.stringForColumn("isread")
//                word.state = rs.stringForColumn("state")
//                resultDatas.append(word)
//            }
            completionHandler(true, resultDatas)
        } catch let error as NSError {
            completionHandler(false, error)
        }
        database.close()
    }
    
    func loadWord(dbName: String, executyQuery: String, completionHandler: CompletionHandler) {
        
        self.queryDatabase(dbName, executyQuery: executyQuery) { (state, data) in
            var resultDatas = Array<WordModel>()
            let rs = data as! FMResultSet
            while rs.next() {
            let word = WordModel()
            word.id = rs.stringForColumn("_id")
            word.name = rs.stringForColumn("name")
            word.category = rs.stringForColumn("category")
            word.read = rs.stringForColumn("read")
            word.vicontent = rs.stringForColumn("vicontent")
            word.isread = rs.stringForColumn("isread")
            word.state = rs.stringForColumn("state")
            resultDatas.append(word)
            }
            completionHandler(true, resultDatas)
        }
        
    }
    
    func loadSentence(dbName: String, executyQuery: String, completionHandler: CompletionHandler) {
        self.queryDatabase(dbName, executyQuery: executyQuery) { (state, data) in
            var resultDatas = Array<SentenceModel>()
            let rs = data as! FMResultSet
            while rs.next() {
                let sentence = SentenceModel()
                sentence.id = rs.stringForColumn("id")
                sentence.category_id = rs.stringForColumn("category_id")
                sentence.sequence = rs.stringForColumn("sequence")
                sentence.sentence_en = rs.stringForColumn("sentence_en")
                sentence.sentence_vi = rs.stringForColumn("sentence_vi")
                resultDatas.append(sentence)
            }
            completionHandler(true, resultDatas)
        }

    }
    
    func loadTopic(dbName: String, executyQuery: String, completionHandler: CompletionHandler) {
        self.queryDatabase(dbName, executyQuery: executyQuery) { (state, data) in
            var resultDatas = Array<TopicModel>()
            let rs = data as! FMResultSet
            while rs.next() {
                let topic = TopicModel()
                topic.id = rs.stringForColumn("id")
                topic.name = rs.stringForColumn("name")
                topic.sequence = rs.stringForColumn("sequence")
                topic.name_ansi = rs.stringForColumn("name_ansi")
                resultDatas.append(topic)
            }
            completionHandler(true, resultDatas)
        }
        
    }
    
    func updateDatabase(dbName: String, executyQuery: String) {
        let sourcePath = NSBundle.mainBundle().pathForResource(dbName, ofType: "sqlite")
        let database = FMDatabase(path: sourcePath)
        if !database.open() {
            print("Unable to open database")
            return
        }
        do {
             try database.executeUpdate(executyQuery, values: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        database.close()
    }
    
}