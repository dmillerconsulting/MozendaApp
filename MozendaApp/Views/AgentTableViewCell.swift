//
//  AgentTableViewCell.swift
//  MozendaApp
//
//  Created by Work on 7/18/19.
//  Copyright © 2019 Giglioroninomicon. All rights reserved.
//

import UIKit
import MozendaSwift

class AgentTableViewCell: UITableViewCell {
    @IBOutlet weak var agentNameLabel: UILabel!
    @IBOutlet weak var agentDescriptionLabel: UILabel!
    @IBOutlet weak var agentStatusIndicator: UIView!
    @IBOutlet weak var agentCellStackView: UIStackView!
    
    var agent: Agent? {
        didSet {
            self.setupViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews() {
        guard let agent = self.agent else { return }
        
        self.agentStatusIndicator.layer.cornerRadius = self.agentStatusIndicator.frame.height / 2
        self.agentStatusIndicator.clipsToBounds = true
        
        self.agentNameLabel.text = "\(agent.agentId) - \(agent.name)"
        
//        if agent.description == "" {
//            let descriptionView = self.agentCellStackView.arrangedSubviews[0]
//            self.agentCellStackView.removeArrangedSubview(descriptionView)
//        }
        
        self.agentDescriptionLabel.text = agent.description
        
        switch agent.status {
        case .Cancelled:
            setStatusIdiciatorColor(.yellow)
        case .Error:
            setStatusIdiciatorColor(.red)
        case .Paused:
            setStatusIdiciatorColor(.lightGray)
        case .Pausing:
            setStatusIdiciatorColor(.darkGray)
        case .Ready:
            setStatusIdiciatorColor(.green)
        case .Running:
            setStatusIdiciatorColor(.blue)
        }
    }
    
    func setStatusIdiciatorColor(_ color: UIColor) {
        agentStatusIndicator.backgroundColor = color
    }

}
