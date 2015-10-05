//
//  SearchResult.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/04.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation

enum SearchResultWrapperType: String {
    case Track = "track"
    case Collection = "collection"
    case Artist = "artist"
}

public enum SearchResultKind: String {
    case Book = "book"
    case Album = "album"
    case CoachedAudio = "coached-audio"
    case FeatureMovie = "feature-movie"
    case InteractiveBooklet = "interactive-booklet"
    case MusicVideo = "music-video"
    case PdfPodcast = "pdf podcast"
    case PodcastEpisode = "podcast-episode"
    case SoftwarePackage = "software-package"
    case Song = "song"
    case TvEpisode = "tv-episode"
    case Artist = "artist"

}

public enum SearchResult {
    case Track(SearchResultTrack)
    case Artist(SearchResultArtist)
    case Collection(SearchResultCollection)
}

public struct SearchResultTrack {
    
    public internal(set) var kind: SearchResultKind
    public internal(set) var artistId: Int
    public internal(set) var collectionId: Int
    public internal(set) var trackId: Int
    public internal(set) var artistName: String
    public internal(set) var collectionName: String
    public internal(set) var trackName: String
    public internal(set) var collectionCensoredName: String
    public internal(set) var trackCensoredName: String
    
    
    public internal(set) var artistViewUrl: String
    public internal(set) var collectionViewUrl: String
    public internal(set) var trackViewUrl: String
    
    public internal(set) var previewUrl: String
    
    public internal(set) var artworkUrl30: String
    public internal(set) var artworkUrl60: String
    public internal(set) var artworkUrl100: String
    
    public internal(set) var collectionPrice: Float
    public internal(set) var trackPrice: Float
    
    public internal(set) var releaseDate: String
    
    public internal(set) var collectionExplicitness: String
    public internal(set) var trackExplicitness: String
    
    public internal(set) var discCount: Int
    public internal(set) var discNumber: Int
    
    public internal(set) var trackCount: Int
    public internal(set) var trackNumber: Int
    
    public internal(set) var trackTimeMillis: Int
    
    public internal(set) var country: String
    public internal(set) var currency: String
    
    public internal(set) var primaryGenreName: String
    
    public internal(set) var radioStationUrl: String?
    
    public internal(set) var isStreamable: Bool
}

public struct SearchResultArtist {
    
    public internal(set) var artistType: String
    
    public internal(set) var artistName: String
    public internal(set) var artistLinkUrl: String
    public internal(set) var artistId: Int
    public internal(set) var amgArtistId: Int
    
    public internal(set) var primaryGenreName: String
    public internal(set) var primaryGenreId: Int
    
    public internal(set) var radioStationUrl: String?
}


public struct SearchResultCollection {
    
    public internal(set) var collectionType: String
    public internal(set) var artistId: Int
    public internal(set) var collectionId: Int
    public internal(set) var amgArtistId: Int
    public internal(set) var artistName: String
    public internal(set) var collectionName: String
    public internal(set) var collectionCensoredName: String
    
    
    public internal(set) var artistViewUrl: String
    public internal(set) var collectionViewUrl: String
    
    
    public internal(set) var artworkUrl30: String
    public internal(set) var artworkUrl60: String
    public internal(set) var artworkUrl100: String
    
    public internal(set) var collectionPrice: Float
    
    public internal(set) var collectionExplicitness: String
    
    public internal(set) var trackCount: Int
    
    public internal(set) var copyright: String
    
    public internal(set) var country: String
    public internal(set) var currency: String
    
    public internal(set) var releaseDate: String
    
    public internal(set) var primaryGenreName: String
    
    public internal(set) var radioStationUrl: String?
}
