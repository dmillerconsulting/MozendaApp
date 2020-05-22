//
//  AgentsSplitViewController.swift
//  Mozenda
//
//  Created by Work on 4/22/20.
//  Copyright © 2020 Giglioroninomicon. All rights reserved.
//

import UIKit

class AgentsSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        preferredDisplayMode = .allVisible
        fetchAgents()
        // Do any additional setup after loading the view.
    }
    
    func fetchAgents() {
        NetworkController.performRequest(httpMethod: .Get, urlParameters: ["Operation":"Agent.GetList"]) { (data, error) in
            if let error = error {
                print(error)
            }
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let agents = try? JSONDecoder().decode(Agent.self, from: data)
                print(agents)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AgentsSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func splitViewControllerSupportedInterfaceOrientations(_ splitViewController: UISplitViewController) -> UIInterfaceOrientationMask {
        return .all
    }
}
