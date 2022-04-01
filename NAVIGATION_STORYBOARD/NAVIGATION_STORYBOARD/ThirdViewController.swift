//
//  ThirdViewController.swift
//  NAVIGATION_STORYBOARD
//
//  Created by SP11601 on 31/03/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var data: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = data {
            print("Data = \(data)")
        }

        title = "Third View"

    }
    
}
