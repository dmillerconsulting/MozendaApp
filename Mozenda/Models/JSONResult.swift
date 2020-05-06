//
//  JSONResult.swift
//  Mozenda
//
//  Created by Work on 5/6/20.
//  Copyright © 2020 Giglioroninomicon. All rights reserved.
//

import Foundation

struct JSONResult: Codable {
    var command: Command
    var result: Result
    var errorCode: String?
    var errorDescription: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .jsonResult)
        
        command = try response.decode(Command.self, forKey: .command)
        result = try response.decode(Result.self, forKey: .result)
        errorCode = try response.decode(String.self, forKey: .errorCode)
        errorDescription = try response.decode(String.self, forKey: .errorDescription)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .jsonResult)
        
        try response.encode(command, forKey: .command)
        try response.encode(result, forKey: .result)
        try response.encode(errorCode, forKey: .errorCode)
        try response.encode(errorDescription, forKey: .errorDescription)
    }
    
    enum CodingKeys: String, CodingKey {
        case jsonResult = "JsonResult"
        case command = "Command"
        case result = "Result"
        case errorCode = "ErrorCode"
        case errorDescription = "ErrorDescription"
    }
}

// FIXME: Get all available Commands
enum Command: String, Codable {
    case jobPause = "Job.Pause"
}
