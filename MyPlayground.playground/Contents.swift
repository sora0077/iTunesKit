//: Playground - noun: a place where people can play

import UIKit
import iTunesKit
import APIKit
import XCPlayground


enum Error: APIKitErrorType {
    
    case Unknown
    
    static func networkError(error: ErrorType) -> Error {
        return .Unknown
    }
    
    static func validationError(error: ErrorType) -> Error {
        return .Unknown
    }
    
    static func serializeError(error: ErrorType) -> Error {
        return .Unknown
    }
}


let itunes = API<Error>()

var search = Search(term: "lisa", country: "JP")
//search.media = "media"
itunes.request(search).onSuccess { v in
    print(v)
}


//itunes.request(Lookup(id: 164283721)).onSuccess { v in
//    print(v)
//}

//let ranking = Ranking.allRankingTypes("ja")[7]
//
//itunes.request(ranking).onSuccess { v -> Void in
//    
//    UIImage(data: NSData(contentsOfURL: NSURL(string: v.chart.content[0].artwork.last!.url)!)!)
//    UIImage(data: NSData(contentsOfURL: NSURL(string: v.chart.content[1].artwork.last!.url)!)!)
//    UIImage(data: NSData(contentsOfURL: NSURL(string: v.chart.content[2].artwork.last!.url)!)!)
//    UIImage(data: NSData(contentsOfURL: NSURL(string: v.chart.content[3].artwork.last!.url)!)!)
//    UIImage(data: NSData(contentsOfURL: NSURL(string: v.chart.content[4].artwork.last!.url)!)!)
//    UIImage(data: NSData(contentsOfURL: NSURL(string: v.chart.content[5].artwork.last!.url)!)!)
//    print(v.chart.content)
//    
//}

let ranking = Ranking.allRankingTypes("ja")[7]
itunes.request(ranking).flatMap { (v: RankingResult) in
    itunes.request(TrackViewUrl(url: v.chart.content[0].url))
    }.onSuccess { v in
 
        print(v)
}


XCPSetExecutionShouldContinueIndefinitely()

