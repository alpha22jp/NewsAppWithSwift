//
//  ResponseData.swift
//  NewsApp
//
//  Created by TanakaJun on 2015/12/31.
//  Copyright © 2015年 edu.self. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Entry: Object, Mappable {
    dynamic var title = ""
    dynamic var link = ""
    dynamic var contentSnippet = ""
    dynamic var category = ""

    required convenience init?(_ map: ObjectMapper.Map) {
        self.init()
    }

    func mapping(map: Map) {
        title <- map["title"]
        link <- map["link"]
        contentSnippet <- map["contentSnippet"]
    }

    override class func primaryKey() -> String {
        return "link"
    }

}

class Feed: Mappable {
    var entries: [Entry]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        entries <- map["entries"]
    }

}
