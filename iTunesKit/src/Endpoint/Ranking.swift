//
//  Ranking.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/08.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import APIKit

public struct Ranking {
    
    public var genreId: Int
    
    public var lang: String
    
    public let key: String
    
    let popId: Int = 1
    
    let dataOnly: Bool = true
    
    public static func allRankingTypes(lang: String, path: String = NSBundle(forClass: iTunesKit.self).pathForResource("itunes_genre_mapping", ofType: "plist")!) -> [Ranking] {
        
        let genreMappings = NSDictionary(contentsOfFile: path)?["music"]?["genre"] as? [String: AnyObject]
        
        var rankings: [Ranking] = []
        for (key, value) in genreMappings ?? [:] {
            let genreId = value["genreId"] as! Int
            let ranking = Ranking(
                genreId: genreId,
                lang: lang,
                key: key
            )
            rankings.append(ranking)
        }
        return rankings
    }
}

private extension Dictionary {
    
    func get<T>(key: Key) -> T {
        return self[key] as! T
    }
    
    func optionalGet<T>(key: Key) -> T? {
        return self[key] as? T
    }
}

extension Ranking: iTunesRequestToken {
    
    public typealias Response = RankingResult
    public typealias SerializedObject = [String: AnyObject]
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public var path: String {
        return "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop"
    }
    
    public var headers: [String : String]? {
        return [
            "User-Agent": "iTunes-iPhone/9.0.1",
            "X-Apple-Store-Front": "143462-9,16"
        ]
    }
    
    public var parameters: [String: AnyObject]? {
        return [
            "genreId": genreId,
            "popId": popId,
            "l": lang,
            "dataOnly": dataOnly ? "true" : "false"
        ]
    }
    
    public func transform(request: NSURLRequest?, response: NSHTTPURLResponse?, object: SerializedObject) throws -> Response {
        
        typealias JSON = [String: AnyObject]
        
        return RankingResult(
            genreId: Int(object["genreId"] as! String)!,
            mediaType: Int(object["mediaType"] as! String)!,
            charts: RankingResult.Chart.array(object["charts"] as! [JSON])
        )
    }
}
