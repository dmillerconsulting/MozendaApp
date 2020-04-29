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
    var job: AgentJob
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
