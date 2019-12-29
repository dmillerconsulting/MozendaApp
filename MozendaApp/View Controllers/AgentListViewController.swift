//
//  AgentListViewController.swift
//  MozendaApp
//
//  Created by Work on 5/24/19.
//  Copyright © 2019 Giglioroninomicon. All rights reserved.
//

import UIKit
import MozendaSwift
import FirebaseAnalytics
import SwiftyJSON

class AgentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - IBOutlets
    @IBOutlet var agentTableView: UITableView!
    
    // MARK: - Properties
    var agents: [Agent] = [] {
        didSet {
            DispatchQueue.main.async {
                self.agentTableView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.agentTableView.tableFooterView = UIView()
        
        AgentService.getAgentList { (agents) in
            self.agents = agents
        }
    }
    
    // MARK: - Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.agentTableView.dequeueReusableCell(withIdentifier: "agentCell", for: indexPath) as? AgentTableViewCell else { return UITableViewCell() }
        
        cell.agent = agents[indexPath.row]
        
        return cell
    }
    
    // MARK: - Navigation Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // MARK: - Business Logic
    
    // MARK: - IBActions
}
