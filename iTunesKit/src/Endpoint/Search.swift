//
//  Search.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/04.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import APIKit

public struct Search {
    /// The URL-encoded text string you want to search for. For example: jack+johnson.
    /// Any URL-encoded text string.
    ///
    /// Note: URL encoding replaces spaces with the plus (+) character and all characters except the following are encoded: letters, numbers, periods (.), dashes (-), underscores (_), and asterisks (*).
    public var term: String
    
    /// The two-letter country code for the store you want to search. The search uses the default store front for the specified country. For example: US.
    ///
    /// The default is US.
    public var country: String
    
    /// The media type you want to search for. For example: movie.
    ///
    /// The default is all.
    public var media: String = "all"
    
    /// The type of results you want returned, relative to the specified media type. For example: movieArtist for a movie media type search.
    ///
    /// The default is the track entity associated with the specified media type.
    public var entity: String = "allTrack"
    
    /// The attribute you want to search for in the stores, relative to the specified media type. For example, if you want to search for an artist by name specify entity=allArtist&attribute=allArtistTerm.
    ///
    /// In this example, if you search for term=maroon, iTunes returns "Maroon 5" in the search results, instead of all artists who have ever recorded a song with the word "maroon" in the title.
    ///
    /// The default is all attributes associated with the specified media type.
    public var attribute: String?
    
    /// The number of search results you want the iTunes Store to return. For example: 25.
    ///
    /// The default is 50.
    public var limit: Int = 50
    
    /// The language, English or Japanese, you want to use when returning search results. Specify the language using the five-letter codename. For example: en_us.
    ///
    /// The default is en_us (English).
    public var lang: String = "en_us"
    
    /// A flag indicating whether or not you want to include explicit content in your search results.
    ///
    /// The default is Yes.
    public var explicit: Bool = true
    
    /**
    <#Description#>
    
    - parameter term:    Y
    - parameter country: Y
    
    - returns: <#return value description#>
    */
    public init(term: String, country: String = "US") {
        self.term = term
        self.country = country
    }
}

extension Search: iTunesRequestToken {
    
    public typealias Response = [SearchResult]
    public typealias SerializedObject = [String: AnyObject]
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public var path: String {
        return "https://itunes.apple.com/search"
    }
    
    public var parameters: [String: AnyObject]? {
        var dict: [String: AnyObject] = [
            "term": term,
            "country": country,
            "media": media,
            "entity": entity,
            "limit": limit,
            "lang": lang,
            "explicit": explicit ? "Yes" : "No"
        ]
        if let attribute = attribute {
            dict["attribute"] = attribute
        }
        return dict
    }
    
    public func transform(request: NSURLRequest?, response: NSHTTPURLResponse?, object: SerializedObject) throws -> Response {
        print(request, object)
        
        return (object["results"] as! [[String: AnyObject]]).map { v in
            let wrapperType = SearchResultWrapperType(rawValue: v["wrapperType"] as! String)!
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
                    amgArtistId: v["amgArtistId"] as! Int,
                    
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
