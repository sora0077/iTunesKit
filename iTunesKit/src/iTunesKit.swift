//
//  iTunesKit.swift
//  iTunesKit
//
//  Created by 林達也 on 2015/10/04.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import APIKit


protocol iTunesRequestToken: RequestToken {}

extension iTunesRequestToken {
    
    var baseURL: NSURL? {
        return NSURL(string: "http://")
    }
}
