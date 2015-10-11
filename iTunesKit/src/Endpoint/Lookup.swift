//
//  Lookup.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/06.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import APIKit

public struct Lookup {
    
    public private(set) var parameters: [String: AnyObject]? = [:]
    
    public init(id: Int, country: String = "US") {
        parameters?["id"] = id
        parameters?["country"] = country
    }
    
}

extension Lookup: iTunesRequestToken {
    
    public typealias Response = [SearchResult]
    public typealias SerializedObject = [String: AnyObject]
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public var path: String {
        return "https://itunes.apple.com/lookup"
    }
    
    public func transform(request: NSURLRequest?, response: NSHTTPURLResponse?, object: SerializedObject) throws -> Response {
        print(request, object)
        
        return (object["results"] as! [[String: AnyObject]]).map { v in
            guard let wrapperType = SearchResultWrapperType(rawValue: v["wrapperType"] as! String) else {
                return .Unsupported(v)
            }
            switch wrapperType {
            case .Track:
                return .Track(SearchResultTrack(
                    kind: SearchResultKind(rawValue: v["kind"] as! String)!,
                    artistId: v["artistId"] as! Int,
                    collectionId: v["collectionId"] as! Int,
                    trackId: v["trackId"] as! Int,
                    artistName: v["artistName"] as! String,
                    collectionName: v["collectionName"] as! String,
                    trackName: v["trackName"] as! String,
                    collectionCensoredName: v["collectionCensoredName"] as! String,
                    trackCensoredName: v["trackCensoredName"] as! String,
                    
                    artistViewUrl: v["artistViewUrl"] as! String,
                    collectionViewUrl: v["collectionViewUrl"] as! String,
                    trackViewUrl: v["trackViewUrl"] as! String,
                    
                    previewUrl: v["previewUrl"] as! String,
                    
                    artworkUrl30: v["artworkUrl30"] as! String,
                    artworkUrl60: v["artworkUrl60"] as! String,
                    artworkUrl100: v["artworkUrl100"] as! String,
                    
                    collectionPrice: v["collectionPrice"] as! Float,
                    trackPrice: v["trackPrice"] as! Float,
                    
                    releaseDate: v["releaseDate"] as! String,
                    
                    collectionExplicitness: v["collectionExplicitness"] as! String,
                    trackExplicitness: v["trackExplicitness"] as! String,
                    
                    discCount: v["discCount"] as! Int,
                    discNumber: v["discNumber"] as! Int,
                    
                    trackCount: v["trackCount"] as! Int,
                    trackNumber: v["trackNumber"] as! Int,
                    
                    trackTimeMillis: v["trackTimeMillis"] as! Int,
                    
                    country: v["country"] as! String,
                    currency: v["currency"] as! String,
                    
                    primaryGenreName: v["primaryGenreName"] as! String,
                    
                    radioStationUrl: v["radioStationUrl"] as? String,
                    
                    isStreamable: v["isStreamable"] as! Bool
                ))
            case .Artist:
                return .Artist(SearchResultArtist(
                    artistType: v["artistType"] as! String,
                    artistName: v["artistName"] as! String,
                    artistLinkUrl: v["artistLinkUrl"] as! String,
                    artistId: v["artistId"] as! Int,
                    amgArtistId: v["amgArtistId"] as? Int,
                    
                    primaryGenreName: v["primaryGenreName"] as! String,
                    primaryGenreId: v["primaryGenreId"] as! Int,
                    
                    radioStationUrl: v["radioStationUrl"] as? String
                ))
            case .Collection:
                return .Collection(SearchResultCollection(
                    collectionType: v["collectionType"] as! String,
                    artistId: v["artistId"] as! Int,
                    collectionId: v["collectionId"] as! Int,
                    amgArtistId: v["amgArtistId"] as! Int,
                    artistName: v["artistName"] as! String,
                    collectionName: v["collectionName"] as! String,
                    collectionCensoredName: v["collectionCensoredName"] as! String,
                    
                    artistViewUrl: v["artistViewUrl"] as! String,
                    collectionViewUrl: v["collectionViewUrl"] as! String,
                    
                    artworkUrl30: v["artworkUrl30"] as! String,
                    artworkUrl60: v["artworkUrl60"] as! String,
                    artworkUrl100: v["artworkUrl100"] as! String,
                    
                    collectionPrice: v["collectionPrice"] as! Float,
                    
                    collectionExplicitness: v["collectionExplicitness"] as! String,
                    
                    trackCount: v["trackCount"] as! Int,
                    
                    copyright: v["copyright"] as! String,
                    
                    country: v["country"] as! String,
                    currency: v["currency"] as! String,
                    
                    releaseDate: v["releaseDate"] as! String,
                    
                    primaryGenreName: v["primaryGenreName"] as! String,
                    
                    radioStationUrl: v["radioStationUrl"] as? String
                ))
            }
        }
    }
}
