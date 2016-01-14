//
//  RequestManager.swift
//  RecipeCatsiOS
//
//  Created by FumikoIshizawa on 2016/01/14.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import Foundation
import APIKit
import ObjectMapper

public protocol RecipeCatsRequestType: RequestType {
    
}


extension RecipeCatsRequestType where Self.Response: Mappable {
    var baseURL: NSURL {
        return NSURL(string: "http://127.0.0.1:8000/api/v1/")!
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) -> Self.Response? {
        guard let dictionary = object as? [String: AnyObject] else {
            return nil
        }
        
        let mapper = Mapper<Response>()
        guard let object = mapper.map(dictionary) else {
            return nil
        }
        
        return object
    }
}


struct GetRecipeListRequest: RecipeCatsRequestType {
    typealias Response = Recipe
    
    var path: String{
        return "recipe/"
    }

    var method: HTTPMethod {
        return .GET
    }
}


struct PostRecipeRequest: RecipeCatsRequestType {
    typealias Response = Recipe
    
    var path: String {
        return "recipe/"
    }
    
    var method: HTTPMethod {
        return .POST
    }
    
}
