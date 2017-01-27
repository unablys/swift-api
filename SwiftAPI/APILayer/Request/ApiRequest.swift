//
//  ApiRequest.swift
//  SwiftAPI
//
//  Created by Marek Kojder on 24.01.2017.
//  Copyright © 2017 XSolve. All rights reserved.
//

import Foundation

public struct ApiRequest {

    private let request: WebRequest

    ///Progress object which allows to follow request progress.
    var progress: Progress? {
        return nil //request.progress
    }

    ///Creates request based on WebRequest
    init(webRequest: WebRequest) {
        self.request = webRequest
    }

    ///Temporarily suspends request.
    func suspend() {
        request.suspend()
    }

    ///Resumes request, if it is suspended.
    func resume() {
        request.resume()
    }

    ///Cancels request.
    func cancel() {
        request.cancel()
    }
}
