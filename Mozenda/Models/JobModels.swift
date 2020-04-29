//
//  JobModels.swift
//  Mozenda
//
//  Created by Work on 4/29/20.
//  Copyright © 2020 Giglioroninomicon. All rights reserved.
//

import Foundation

struct Job: Codable {
    var activeJob: Bool
    var created: String
    var modified: String
    var itemSourceName: String
    var jobID: Int
    var jobType: AgentJobType
    var status: AgentStatus
    var command: String
    var start: String
    var started: String
    var ended: String
    var jobRestriction: String
    var jobKey: String
    var scheduleID: String
    var scheduleItemType: String
    var scheduleItemID: String
    var errorCode: String
    var errorMessage: String
    var errorDetail: String
    var errorFirst: String
    var errorLast: String
    var errorCount: String
    var warningFirst: String
    var warningLast: String
    var warningCount: String
    var batchID: String
    var batchOrder: String
    var name: String
    var description: String
    var state: JobState
    var sequenceID: String?
    var duration: String
    
    enum CodingKeys: String, CodingKey {
        case activeJob = "ActiveJob"
        case created = "Created"
        case modified = "Modified"
        case itemSourceName = "ItemSourceName"
        case jobID = "JobID"
        case jobType = "JobType"
        case status = "Status"
        case command = "Command"
        case start = "Start"
        case started = "Started"
        case ended = "Ended"
        case jobRestriction = "JobRestriction"
        case jobKey = "JobKey"
        case scheduleID = "ScheduleID"
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
        case warningCount = "WarningCount"
        case batchID = "BatchID"
        case batchOrder = "BatchOrder"
        case name = "Name"
        case description = "Description"
        case state = "State"
        case sequenceID = "SequenceID"
        case duration = "Duration"
        
    }
}

enum JobState: String, Codable {
    case done = "Done"
}
