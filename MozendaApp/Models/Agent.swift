//
//  Agent.swift
//  MozendaSwift
//
//  Created by Work on 5/22/19.
//  Copyright © 2019 Giglioroninomicon. All rights reserved.
//

import Foundation

let sampleJson = """
[
{
"Created":"2011-08-05 15:07:17",
"Modified":"2013-11-16 03:10:18",
"AgentID":1004,
"Name":"CaseNet",
"Description":"",
"Settings":"StopOnHarvestingError,
UseAnonymizer","Status":"Ready"
},
{
"Created":"2011-08-05 15:07:17",
"Modified":"2013-11-16 03:10:18",
"AgentID":1004,
"Name":"CaseNet",
"Description":"",
"Settings":"StopOnHarvestingError,UseAnonymizer",
"Status":"Ready"
}
]
""".data(using: .utf8)!

public class Agent: Codable {
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    
    public let createdDate: Date
    public let modifiedDate: Date
    public let agentId: Int
    public let name: String
    public let description: String
    public let status: Status
    public let settings: String
    
    public enum Status: String, Codable {
        case Cancelled = "Cancelled"
        case Error = "Error"
        case Paused = "Paused"
        case Pausing = "Pausing"
        case Ready = "Ready"
        case Running = "Running"
    }
    
    enum CodingKeys: String, CodingKey {
        case createdDate = "Created"
        case modifiedDate = "Modified"
        case agentId = "AgentID"
        case name = "Name"
        case description = "Description"
        case settings = "Settings"
        case status = "Status"
    }
    
    required public init(from decoder: Decoder) throws {
        let decodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        let createdDateString = try decodingContainer.decode(String.self, forKey: .createdDate)
        self.createdDate = self.dateFormatter.date(from: createdDateString) ?? Date()
        
        let modifiedDateString = try decodingContainer.decode(String.self, forKey: .modifiedDate)
        self.modifiedDate = self.dateFormatter.date(from: modifiedDateString) ?? Date()
        
        self.agentId = try decodingContainer.decode(Int.self, forKey: .agentId)
        self.name = try decodingContainer.decode(String.self, forKey: .name)
        self.description = try decodingContainer.decode(String.self, forKey: .description)
        self.settings = try decodingContainer.decode(String.self, forKey: .settings)
        self.status = Agent.Status(rawValue: try decodingContainer.decode(String.self, forKey: .status)) ?? .Ready
    }
}

extension Agent {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(createdDate, forKey: .createdDate)
        try container.encode(modifiedDate, forKey: .modifiedDate)
        try container.encode(agentId, forKey: .agentId)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(settings, forKey: .settings)
        try container.encode(status, forKey: .status)
    }
}
