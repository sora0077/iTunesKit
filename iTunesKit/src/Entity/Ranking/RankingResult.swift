//
//  RankingResult.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/09.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation

public struct RankingResult {
    
    public var genreId: Int
    
    public var mediaType: Int
    
    public var charts: [Chart]
    
    public struct Chart {
        
        public var batchSize: Int
        
        public var chartDataUrl: String
        
        public var chartId: Int
    
        public var chartLimit: Int
        
        public var componentName: String
        
        public var content: [Content]
        
        public var title: String
        
        public struct Content {
            
            public var art_token: String
            
            public var artistId: Int?
            
            public var artistName: String
            
            public var artistUrl: String?
            
            public var artwork: [Artwork]

            public var componentName: String
            
            public var genre: String
            
            public var id: Int

            public var isAddToWishlist: Int
            
            public var kind: String
            
            public var name: String
            
            public var offers: [Offer]
            
            public var parent: Parent

            public var preview: (
                duration: Int,
                url: String
            )
            
            public var release_date: String
            
            public var release_date_utc: String
            
            public var shareEmailBodyURL: String
            
            public var time: String
            
            public var tinyUrl: String
            
            public var url: String
            
            public struct Artwork {
                
                public var width: Int
                
                public var height: Int
                
                public var url: String
            }
            
            public struct Offer {
                
                public var action_params: String
                
                public var assetFlavors: [AssetFlavor]
                
                public var button_text: String
                public var confirm_text: String?
                public var isGiftable: Bool?
                public var priceFormatted: String?
                
                public var priceType: String
                
                public struct AssetFlavor {
                    
                    public var fileSize: Int
                    
                    public var fileSizeText: String
                    
                    public var name: String
                    
                    public var preview: (
                        duration: Int,
                        url: String
                    )
                }
            }
            
            public struct Parent {
                
                public var art_token: String
                
                public var artistId: Int?
                
                public var artistName: String
                
                public var artistUrl: String?
                
                public var artwork: [Artwork]
                
                public var componentName: String
                
                public var genre: String
                
                public var id: Int
                
                public var isAddToWishlist: Int

                public var kind: String
                
                public var name: String
                
//                public var offers: (
//                    action_params: String,
//                    button_text: String,
//                    confirm_text: String,
//                    isGiftable: Bool,
//                    priceFormatted: String,
//                    priceType: String
//                )
                
                public var release_date: String?
                
                public var release_date_utc: String?
                
                public var shareEmailBodyURL: String
                
                public var tinyUrl: String
                
                public var trackCount: String
                
                public var tracks: [Int]

                public var url: String
            }
            
        }
    }
}

typealias JSON = [String: AnyObject]

extension RankingResult {
    
    public var chart: Chart {
        return charts[0]
    }
}


extension RankingResult.Chart {
    
    static func array(array: [[String: AnyObject]]) -> [RankingResult.Chart] {
        return array.map { (dict: [String: AnyObject]) in
            RankingResult.Chart(
                batchSize: dict["batchSize"] as! Int,
                chartDataUrl: dict["chartDataUrl"] as! String,
                chartId: Int(dict["chartId"] as! String)!,
                chartLimit: dict["chartLimit"] as! Int,
                componentName: dict["componentName"] as! String,
                content: RankingResult.Chart.Content.array(dict["content"] as! [JSON]),
                title: dict["title"] as! String
            )
        }
    }
}

extension RankingResult.Chart.Content {
    
    static func array(array: [[String: AnyObject]]) -> [RankingResult.Chart.Content] {
        return array.map { (dict: [String: AnyObject]) in
            RankingResult.Chart.Content(
                art_token: dict["art"]!["token"] as! String,
                artistId: dict["artistId"] as? Int,
                artistName: dict["artistName"] as! String,
                artistUrl: dict["artistUrl"] as? String,
                artwork: RankingResult.Chart.Content.Artwork.array(dict["artwork"] as! [JSON]),
                componentName: dict["componentName"] as! String,
                genre: dict["genre"] as! String,
                id: Int(dict["id"] as! String)!,
                isAddToWishlist: dict["isAddToWishlist"] as! Int,
                kind: dict["kind"] as! String,
                name: dict["name"] as! String,
                offers: RankingResult.Chart.Content.Offer.array(dict["offers"] as! [JSON]),
                parent: RankingResult.Chart.Content.Parent.unit(dict["parent"] as! JSON),
                preview: (
                    duration: dict["preview"]!["duration"] as! Int,
                    url: dict["preview"]!["url"] as! String
                ),
                release_date: dict["release_date"] as! String,
                release_date_utc: dict["release_date_utc"] as! String,
                shareEmailBodyURL: dict["shareEmailBodyURL"] as! String,
                time: dict["time"] as! String,
                tinyUrl: dict["tinyUrl"] as! String,
                url: dict["url"] as! String
            )
        }
    }
}

extension RankingResult.Chart.Content.Parent {
    
    static func unit(dict: [String: AnyObject]) -> RankingResult.Chart.Content.Parent {
        return RankingResult.Chart.Content.Parent(
            art_token: dict["art"]!["token"] as! String,
            artistId: dict["artistId"] as? Int,
            artistName: dict["artistName"] as! String,
            artistUrl: dict["artistUrl"] as? String,
            artwork: RankingResult.Chart.Content.Artwork.array(dict["artwork"] as! [JSON]),
            componentName: dict["componentName"] as! String,
            genre: dict["genre"] as! String,
            id: Int(dict["id"] as! String)!,
            isAddToWishlist: dict["isAddToWishlist"] as! Int,
            kind: dict["kind"] as! String,
            name: dict["name"] as! String,
            release_date: dict["release_date"] as? String,
            release_date_utc: dict["release_date_utc"] as? String,
            shareEmailBodyURL: dict["shareEmailBodyURL"] as! String,
            tinyUrl: dict["tinyUrl"] as! String,
            trackCount: dict["trackCount"] as! String,
            tracks: dict["tracks"] as! [Int],
            url: dict["url"] as! String
        )
    }
}

extension RankingResult.Chart.Content.Artwork {
    
    static func array(array: [[String: AnyObject]]) -> [RankingResult.Chart.Content.Artwork] {
        return array.map { (dict: [String: AnyObject]) in
            RankingResult.Chart.Content.Artwork(
                width: dict["width"] as! Int,
                height: dict["height"] as! Int,
                url: dict["url"] as! String
            )
        }
    }
}

extension RankingResult.Chart.Content.Offer {
    
    public var assetFlavor: AssetFlavor {
        return assetFlavors[0]
    }
    
    static func array(array: [[String: AnyObject]]) -> [RankingResult.Chart.Content.Offer] {
        return array.map { (dict: [String: AnyObject]) in
            RankingResult.Chart.Content.Offer(
                action_params: dict["action-params"] as! String,
                assetFlavors: AssetFlavor.array(dict["assetFlavors"] as! [[String: AnyObject]]),
                button_text: dict["button_text"] as! String,
                confirm_text: dict["confirm-text"] as? String,
                isGiftable: (dict["isGiftable"] as? String).map { $0 == "true" },
                priceFormatted: dict["priceFormatted"] as? String,
                priceType: dict["priceType"] as! String
            )
        }
    }
}

extension RankingResult.Chart.Content.Offer.AssetFlavor {
    
    static func array(array: [[String: AnyObject]]) -> [RankingResult.Chart.Content.Offer.AssetFlavor] {
        return array.map { dict in
            RankingResult.Chart.Content.Offer.AssetFlavor(
                fileSize: Int(dict["fileSize"] as! String)!,
                fileSizeText: dict["fileSizeText"] as! String,
                name: dict["name"] as! String,
                preview: (
                    duration: dict["preview"]!["duration"] as! Int,
                    url: dict["preview"]!["url"] as! String
                )
            )
        }
    }
}
