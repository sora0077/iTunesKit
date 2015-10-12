//
//  iTunesKitTests.swift
//  iTunesKitTests
//
//  Created by 林達也 on 2015/10/04.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import XCTest
import APIKit
import BrightFutures
@testable import iTunesKit

enum Error: APIKitErrorType {
    
    case Unknown(ErrorType)
    
    static func networkError(error: ErrorType) -> Error {
        return .Unknown(error)
    }
    
    static func validationError(error: ErrorType) -> Error {
        return .Unknown(error)
    }
    
    static func serializeError(error: ErrorType) -> Error {
        return .Unknown(error)
    }
}

extension TrackViewUrl: DebugRequestToken {}


class iTunesKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expect = self.expectationWithDescription("")
        
        let itunes = API<Error>()
        
        
        
        let ranking = Ranking.allRankingTypes("ja")[7]
//        itunes.request(ranking)
//            .flatMap { (v: RankingResult) -> Future<TrackViewUrl.Response, Error> in
//                print(v.chart.content[0].url)
//                return itunes.request(TrackViewUrl(url: v.chart.content[0].url))
//            }
        itunes.request(TrackViewUrl(url: "https://itunes.apple.com/jp/album/rising-hope/id862874145?i=862874227&l=en&uo=4"))
            .onSuccess { v in
                expect.fulfill()
            }
        .onFailure { (error) -> Void in
            if let error = error as? Error {
                switch error {
                case let .Unknown(e):
                    print(e)
                }
            }
            print(error)
            expect.fulfill()
        }
        self.waitForExpectationsWithTimeout(40) { (error) -> Void in
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
