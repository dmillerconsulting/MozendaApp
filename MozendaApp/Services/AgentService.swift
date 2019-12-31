//
//  AgentController.swift
//  MozendaSwift
//
//  Created by Work on 5/22/19.
//  Copyright © 2019 Giglioroninomicon. All rights reserved.
//

import Foundation

public class AgentService {
    
    let baseURL = "https://api.mozenda.com/rest?WebServiceKey=8FD36CD7-2868-4C80-82A4-D0F4026BFA8F&IncludeStartingURL=true&Service=Mozenda10
    public static func getAgentList(includeStartingURL: Bool = true, completion: @escaping ([Agent]) -> Void) {
        
        NetworkController.performRequest(for: <#T##URL#>, httpMethod: <#T##NetworkController.HTTPMethod#>, urlParameters: [""], body: <#T##Data?#>, completion: <#T##((Data?, Error?) -> Void)?##((Data?, Error?) -> Void)?##(Data?, Error?) -> Void#>)
    }
    
    public static func getJobs(for agent: Agent, completion: @escaping ([Job]) -> Void) {
        
    }
    
    public static func getProgress(for agent: Agent, completion: @escaping (AgentProgress) -> Void) {
        
    }
    
    public static func delete(_ agent: Agent, completion: @escaping () -> Void) {
        
    }
    
    public static func run(_ agent: Agent) {
        
    }
}
