//
//  NetworkHandler.swift
//  Mozenda
//
//  Created by Work on 4/29/20.
//  Copyright © 2020 Giglioroninomicon. All rights reserved.
//

import Foundation
import UIKit

// FIXME: Rewrite this crap

class NetworkController {
    
    // MARK: Properties
    static var baseMozendaURL = "https://api.mozenda.com/rest"
    static var limit: Int = 200
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
    }
    
    static func performRequest(for url: URL? = nil,
                               httpMethod: HTTPMethod,
                               urlParameters: [String : String]?,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)?) {
        
        // Build out entire URL
        
        guard let requestURL = self.url(byAdding: urlParameters, to: url) else{ completion?(nil, nil); return }
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        if String(describing: requestURL).range(of: "steampowered.com") != nil {
            NetworkController.decrementLimit()
        }
        
        // Create and "resume" (a.k.a. run) the task
        print(request)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(response as Any)
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            completion?(data, error)
        }
        
        dataTask.resume()
    }
    
    // FIXME: Probably turn this into an extension on URL
    static func url(byAdding parameters: [String : String]?,
                    to url: URL?) -> URL? {
        
        guard let baseURL = URL(string: baseMozendaURL) else { return nil }
        
        let defaultComponents = [URLQueryItem(name: "WebServiceKey", value: "8FD36CD7-2868-4C80-82A4-D0F4026BFA8F"),
                                 URLQueryItem(name: "Service", value: "Mozenda10"),
                                 URLQueryItem(name: "ResponseFormat", value: "JSON")]
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let paramComponents = parameters?.compactMap({ URLQueryItem(name: $0.0, value: $0.1) }) ?? []

        components?.queryItems = defaultComponents
        components?.queryItems?.append(contentsOf: paramComponents)
        
        return components?.url
    }
    
    static func decrementLimit() {
        NetworkController.limit -= 1
        print(NetworkController.limit)
    }
}
