//
//  APIService.swift
//  MozendaSwift
//
//  Created by Work on 5/22/19.
//  Copyright © 2019 Giglioroninomicon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    public static let shared = APIService()
    //FIXME: Move this somewhere else
    public let webServiceKey = "2D25FF5F-7115-4F7E-B1DB-9D583FFE2DB3"
    public var baseUrl: String {
        return "https://api.mozenda.com/rest?WebServiceKey=\(self.webServiceKey)&Service=Mozenda10"
    }
    
    func sendRequest(with parameters: [String:Any] = [:], completion: JSON) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let parameterString = self.buildUrlParameterString(parameters)
        let requestURL = "\(baseUrl)\(parameterString)"
        
        Alamofire.request(requestURL).validate().responseJSON { (response) in
            print(response.data)
        }
    }
    
    func buildUrlParameterString(_ parameters: [String:Any]) -> String {
        var parameterString = ""
        for (key, value) in parameters {
            let singleParameterString = "&\(key)=\(value)"
            parameterString.append(contentsOf: singleParameterString)
        }
        return parameterString
        
    }
    
//    enum HTTPMethod: String {
//        case Get = "GET"
//        case Put = "PUT"
//        case Post = "POST"
//        case Patch = "PATCH"
//        case Delete = "DELETE"
//    }
    
}
