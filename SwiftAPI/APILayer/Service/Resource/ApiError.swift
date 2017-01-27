//
//  ApiError.swift
//  SwiftAPI
//
//  Created by Marek Kojder on 26.01.2017.
//  Copyright © 2017 XSolve. All rights reserved.
//

import Foundation

public struct ApiError: Error {

    enum `Type` {
        case timeout
        case badRequest   //400
        case unauthorized //401
        case forbiden     //403
        case notFound     //404
        case conflict     //409
        case serverInternal     //500
        case badGateaway        //502
        case serviceUnavailable //503
        case clientSide
        case serverSide
    }

    public let debugDescription: String

    init(description: String) {
        self.debugDescription = description
    }

    init(error: Error) {
        self.debugDescription = error.localizedDescription
    }
}
