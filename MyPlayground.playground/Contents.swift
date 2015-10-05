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

itunes.request(Search(term: "jack+johnson", country: "JP")).onSuccess { v in
    print(v)
}



XCPSetExecutionShouldContinueIndefinitely()

