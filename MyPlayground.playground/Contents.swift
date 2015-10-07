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

var search = Search(term: "twitter", country: "JP")
search.media = "media"

itunes.request(search).onSuccess { v in
    print(v)
}
//https://itunes.apple.com/jp/album/edge-of-this-world-single/id
//itunes.request(Lookup(id: 164283721)).onSuccess { v in
//    print(v)
//}


XCPSetExecutionShouldContinueIndefinitely()

