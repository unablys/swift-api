//
//  ApiAuthorization.swift
//  SwiftAPI
//
//  Created by Marek Kojder on 25.01.2017.
//  Copyright © 2017 XSolve. All rights reserved.
//

import Foundation

/**
 Closure called when authorization operation is finished.

 - Parameters:
   - header: Header which should be added to all requests.
   - error: Error which occurred while authorization.

 Error object should be returned only when authorization failed and header only if is needed. When error object is *nil* ApiSerwice assumes that authorization succeeded.
 */
public typealias ApiAuthCompletion = (_ header: ApiHeader?, _ error: ApiError?) -> ()

public protocol ApiAuth {

    /**
     Authorizes user, and returns suitable credentials.

     - Parameter completion: Closure called after authorization
     
     Completion must always be called even if authorization is not needed, otherwise ApiSerwice won't know that is authorized.
     */
    func authorize(with completion:ApiAuthCompletion)
}
