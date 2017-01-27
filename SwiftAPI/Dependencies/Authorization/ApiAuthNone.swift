//
//  ApiAuthNone.swift
//  SwiftAPI
//
//  Created by Marek Kojder on 26.01.2017.
//  Copyright © 2017 XSolve. All rights reserved.
//

import Foundation

///Use it when authorization is not needed
public struct ApiAuthNone: ApiAuth {
    
    public func authorize(with completion: ApiAuthCompletion) {
        completion(nil, nil)
    }
}
