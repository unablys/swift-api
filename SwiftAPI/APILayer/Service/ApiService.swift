//
//  ApiService.swift
//  SwiftAPI
//
//  Created by Marek Kojder on 24.01.2017.
//  Copyright © 2017 XSolve. All rights reserved.
//

import Foundation

/**
 Closure called when api request is finished.

 - Parameters:
   - resource: Resource returned from server if there is any.
   - error: Error which occurred while processing request.
*/
public typealias ApiResponseCompletionHandler = (_ resource: ApiResource?, _ error: ApiError?) -> ()

public final class ApiService {

    ///Base URL of API server. Remember not to finish it with */* sign.
    public let baseUrl: URL

    ///Path string of API on server. May be used for versioning. Remember to star it with */* sign.
    public let apiPath: String

    ///Array of aditional HTTP header fields.
    public private(set) var isAuthorized: Bool

    ///Array of aditional HTTP header fields.
    fileprivate var headerFields: [HttpHeader]

    ///File manager.
    fileprivate let fileManager: FileManagerProtocol

    ///Authorization manager.
    fileprivate let authManager: ApiAuth

    ///Service for managing request with REST server.
    fileprivate lazy var restService: RestService = { [unowned self] in
        return RestService(baseUrl: self.baseUrl, apiPath: self.apiPath, fileManager: self.fileManager)
        }()

    ///Service for uploading and downloading files outside of server.
    fileprivate lazy var remoteFileService: RemoteFileService = { [unowned self] in
        return RemoteFileService(headers: self.headerFields, fileManager: self.fileManager)
        }()

    ///Completion for handling authorization.
    fileprivate lazy var authorizationHandler: ApiAuthCompletion = { [weak self] (header, error) in
            guard let strongSelf = self else {
                debugPrint("ApiService died before authorization finished!")
                return
            }
            if let error = error {
                debugPrint("Error occurred during authorization: \(error.debugDescription)")
                strongSelf.isAuthorized = false
            } else if let header = header {
                strongSelf.headerFields.append(header.httpHeader)
                strongSelf.isAuthorized = true
            } else {
                strongSelf.isAuthorized = true
            }
    }

    fileprivate func completionHandler(for handler: ApiResponseCompletionHandler) -> WebResponseCompletionHandler {
        return { (response: WebResponse?, error: Error?) in
            if let error = error {
                
            }

            response?.statusCode

        }
    }

    public init(baseUrl: URL, apiPath: String, aditionalHeaders: [ApiHeader]?, authManager: ApiAuth, fileManager: FileManagerProtocol) {
        self.baseUrl = baseUrl
        self.apiPath = apiPath
        self.isAuthorized = false
        self.fileManager = fileManager
        self.authManager = authManager
        self.headerFields = []

        //Convert ApiHeaders to HttpHeaders
        if let headers = aditionalHeaders {
            for header in headers {
                self.headerFields.append(header.httpHeader)
            }
        }
        //Start authorization
        self.authManager.authorize(with: authorizationHandler)
    }
}

extension ApiService {
    func get(resource: ApiResource, withProgress: Bool = false) -> ApiRequest? {
        let handler = { (response: WebResponse?, error: Error?) in

        }
        let request = restService.get(resource: resource.name, with: headerFields, useProgress: withProgress, completionHandler: handler)
        return ApiRequest(webRequest: request)
    }

    func post(resource: ApiResource) -> ApiRequest? {

        return nil
    }

    func put(resource: ApiResource) -> ApiRequest? {

        return nil
    }

    func patch(resource: ApiResource) -> ApiRequest? {
        
        return nil
    }
}
