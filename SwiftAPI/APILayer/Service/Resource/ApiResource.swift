//
//  ApiResource.swift
//  SwiftAPI
//
//  Created by Marek Kojder on 24.01.2017.
//  Copyright © 2017 XSolve. All rights reserved.
//

import Foundation

public protocol ApiResource {

    ///REST name of the resource. Resource should be named with URI.
    var name: String{get}
}
