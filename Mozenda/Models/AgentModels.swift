//
//  AgentModels.swift
//  Mozenda
//
//  Created by Work on 4/29/20.
//  Copyright © 2020 Giglioroninomicon. All rights reserved.
//

import Foundation

// FIXME: Figure out how to make these dates using Codable
// FIXME: Look into property wrappers and custon init(decoder) for turning empty strings into nil

// MARK: Structs
struct AgentGetListResponse: Codable {
    var created: String
    var modified: String
    var agentID: Int
    var name: String
    var description: String
    var settings: String
    var status: AgentStatus
    var startingURL: String
    
    enum CodingKeys: String, CodingKey {
        case created = "Created"
        case modified = "Modified"
        case agentID = "AgentID"
        case name = "Name"
        case description = "Description"
        case settings = "Settings"
        case status = "Status"
        case startingURL = "StartingURL"
    }
}

struct AgentGetJobsResponse: Codable {
    var job: [AgentJob?]
}

// FIXME: Should 'command' be an enum?
// FIXME: What is 'jobRestriction'?
// FIXME: Should 'scheduleItemType' be an enum? Same as 'AgentJobType'?
// FIXME: Should 'errorCode' be an enum?
class AgentJob: Codable {
    var activeJob: Bool?
    var created: String?
    var modified: String?
    var agentName: String?
    var jobID: Int?
    var jobType: AgentJobType?
    var status: AgentStatus?
    var command: String?
    var start: String?
    var started: String?
    var ended: String?
    var jobRestriction: String?
    var jobKey: String?
    var scheduledID: String?
    var scheduleItemType: String?
    var scheduleItemID: Int?
    var errorCode: String?
    var errorMessage: String?
    var errorDetail: String?
    var errorFirst: String?
    var errorLast: String?
    var errorCount: String?
    var warningFirst: String?
    var warningLast: String?
    var batchID: String?
    var batchOrder: String?
    var name: String?
    var description: String?
    var state: String?
    var sequenceID: String?
    var duration: String?
    
    enum CodingKeys: String, CodingKey {
        case activeJob = "ActiveJob"
        case created = "Created"
        case modified = "Modified"
        case agentName = "ItemSourceName"
        case jobID = "JobID"
        case jobType = "JobType"
        case status = "Status"
        case command = "Command"
        case start = "Start"
        case started = "Started"
        case ended = "Ended"
        case jobRestriction = "JobRestriction"
        case jobKey = "JobKey"
        case scheduledID = "ScheduleID"
        case scheduleItemType = "ScheduleItemType"
        case scheduleItemID = "ScheduleItemID"
        case errorCode = "ErrorCode"
        case errorMessage = "ErrorMessage"
        case errorDetail = "ErrorDetail"
        case errorFirst = "ErrorFirst"
        case errorLast = "ErrorLast"
        case errorCount = "ErrorCount"
        case warningFirst = "WarningFirst"
        case warningLast = "WarningLast"
        case batchID = "BatchID"
        case batchOrder = "BatchOrder"
        case name = "Name"
        case description = "Description"
        case state = "State"
        case sequenceID = "SequenceID"
        case duration = "Duration"
    }
}

struct AgentRunResponse: Codable {
    var agentID: Int
    var jobID: Int
    var jobType: AgentJobType
    var reportRefreshJobID: Int
    
    enum CodingKeys: String, CodingKey {
        case agentID = "AgentID"
        case jobID = "JobID"
        case jobType = "JobType"
        case reportRefreshJobID = "ReportRefreshJobID"
    }
}

struct AgentGetJobResponse: Codable {
    var jobs: [Job]
    
    enum CodingKeys: String, CodingKey {
        case jobs = "Job"
    }
}

struct AgentCombinedCollectionsResponse: Codable {
    var agent: [AgentCombinedCollections]
    
    enum CodingKeys: String, CodingKey {
        case agent = "Agent"
    }
}

// FIXME: Some properties can be strings or ints
struct AgentCombinedCollections: Codable {
    var agentID: Int
    var collections: String?
    
    enum CodingKeys: String, CodingKey {
        case agentID = "AgentID"
        case collections = "SourcesCollections"
    }
}

// MARK: ENUMS
// FIXME: Get full list of statuses
public enum AgentStatus: String, Codable {
    case Ready
    case Error
    case Paused
    case Running
}

enum AgentJobType: String, Codable {
    case WebPageHarvest
}














// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Agent
struct Agent: Codable {
    let created, modified: String
    let agentID: Int
    let name, agentDescription, settings: String
    let status: Status
    let startingURL: String

    enum CodingKeys: String, CodingKey {
        case created
        case modified
        case agentID
        case name
        case agentDescription
        case settings
        case status
        case startingURL
    }
}

enum Status: String, Codable {
    case paused = "Paused"
    case ready = "Ready"
}

// MARK: - JSONResult
struct JSONResult: Codable {
    let command: String
    let autoLoggedIn: Bool
    let webConsoleKey, result, errorCode, errorDescription: String
    let errorList: [JSONAny]
    let executionTime: [String: Int]

    enum CodingKeys: String, CodingKey {
        case command
        case autoLoggedIn
        case webConsoleKey
        case result
        case errorCode
        case errorDescription
        case errorList
        case executionTime
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
