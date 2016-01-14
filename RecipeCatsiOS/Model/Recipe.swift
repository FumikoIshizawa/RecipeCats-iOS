//
//  Recipe.swift
//  RecipeCatsiOS
//
//  Created by FumikoIshizawa on 2016/01/14.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Recipe: Mappable {
    public var title: String!
    public var url: String!
    public var category: Int!
    
    public init?(_ map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        self.title <- map["title"]
        self.url <- map["url"]
        self.category <- map["category"]
    }
}
