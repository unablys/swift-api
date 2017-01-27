//
//  ApiAuthBasic.swift
//  SwiftAPI
//
//  Created by Marek Kojder on 26.01.2017.
//  Copyright © 2017 XSolve. All rights reserved.
//

import Foundation

///Use it in case of Basic Auth
public struct ApiAuthBasic: ApiAuth {

    ///Login used to authorizaton.
    private let login: String

    //Password used to authorization.
    private let password: String

    /**
     - Parameters:
       - login: String which should be used as login while authorizaton.
       - password: String which should be used as password while authorizaton.
     */
    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }

    public func authorize(with completion: ApiAuthCompletion) {
        if let credentials = "\(login):\(password)".data(using: .utf8)?.base64EncodedString(options: .init(rawValue: 0)) {
            let header = ApiHeader(name: "Authorization", value: "Basic \(credentials)")
            completion(header, nil)
        } else {
            let error = ApiError(description: "Credentials encoding failed!")
            completion(nil, error)
        }
    }
}
