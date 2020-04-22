//
//  SettingsSplitViewController.swift
//  Mozenda
//
//  Created by Work on 4/22/20.
//  Copyright © 2020 Giglioroninomicon. All rights reserved.
//

import UIKit

class SettingsSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        preferredDisplayMode = .allVisible
    }

}

extension SettingsSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func splitViewControllerSupportedInterfaceOrientations(_ splitViewController: UISplitViewController) -> UIInterfaceOrientationMask {
        return .all
    }
}
