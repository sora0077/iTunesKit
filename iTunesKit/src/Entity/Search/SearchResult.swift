//
//  SearchResult.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/04.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation

public enum SearchResultWrapperType: String {
    case Track = "track"
    case Collection = "collection"
    case Artist = "artist"
//    case Book = "book"
//    case Album = "album"
//    case CoachedAudio = "coached-audio"
//    case FeatureMovie = "feature-movie"
//    case InteractiveBooklet = "interactive-booklet"
//    case MusicVideo = "music-video"
//    case PdfPodcast = "pdf podcast"
//    case PodcastEpisode = "podcast-episode"
//    case SoftwarePackage = "software-package"
//    case Song = "song"
//    case TvEpisode = "tv-episode"
//    case Artist = "artist"
}

public protocol SearchResult {
    
    var wrapperType: SearchResultWrapperType { get }
    var kind: String { get }
    var artistId: Int { get }
    var collectionId: Int { get }
    var trackId: Int { get }
    var artistName: String { get }
    var collectionName: String { get }
    var trackName: String { get }
    var collectionCensoredName: String { get }
    var trackCensoredName: String { get }
    
    var artistViewUrl: String { get }
    var collectionViewUrl: String { get }
    var trackViewUrl: String { get }
}

public struct SearchResultTrack: SearchResult {
    
    public var wrapperType: SearchResultWrapperType
    public var kind: String
    public var artistId: Int
    public var collectionId: Int
    public var trackId: Int
    public var artistName: String
    public var collectionName: String
    public var trackName: String
    public var collectionCensoredName: String
    public var trackCensoredName: String
    
    
    public var artistViewUrl: String
    public var collectionViewUrl: String
    public var trackViewUrl: String
    
    public var previewUrl: String
    
    public var artworkUrl30: String
    public var artworkUrl60: String
    public var artworkUrl100: String
    
    public var collectionPrice: Float
    public var trackPrice: Float
    
    public var releaseDate: String
    
    public var collectionExplicitness: String
    public var trackExplicitness: String
    
    public var discCount: Int
    public var discNumber: Int
    
    public var trackCount: Int
    public var trackNumber: Int
    
    public var trackTimeMillis: Int
    
    public var country: String
    public var currency: String
    
    public var primaryGenreName: String
    
    public var radioStationUrl: String?
    
    public var isStreamable: Bool
}
