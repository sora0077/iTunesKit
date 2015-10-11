//
//  iTunesKitTests.swift
//  iTunesKitTests
//
//  Created by 林達也 on 2015/10/04.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import XCTest
import APIKit
@testable import iTunesKit

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
        
        
        let ranking = Ranking.allRankingTypes("ja")[3]
        
        itunes.request(ranking).onSuccess { v -> Void in
            print(v)
            expect.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(10) { (error) -> Void in
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
