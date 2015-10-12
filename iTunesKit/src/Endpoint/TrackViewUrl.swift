//
//  TrackViewUrl.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/11.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import APIKit

public struct TrackViewUrl {
    
    public var url: String
    
    public init(url: String) {
        self.url = url
    }
}

extension TrackViewUrl: iTunesRequestToken {
    
    public typealias Response = ()
    public typealias SerializedObject = [String: AnyObject]
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public var path: String {
        return url
    }
    
    public var headers: [String : String]? {
        return [
//            "User-Agent": "iTunes-iPhone/9.0.1",
            "X-Apple-Store-Front": "143462-9,4",
        ]
    }
    
    public var serializer: Serializer {
        return .PropertyList(.Immutable)
    }
    
    public func transform(request: NSURLRequest?, response: NSHTTPURLResponse?, object: SerializedObject) throws -> Response {
        
        print(object)
        return ()
    }
}
