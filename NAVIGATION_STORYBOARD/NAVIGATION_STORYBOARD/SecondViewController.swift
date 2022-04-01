//
//  SecondViewController.swift
//  NAVIGATION_STORYBOARD
//
//  Created by SP11601 on 31/03/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    @IBAction func goToThirdViewController (_ sender: Any) {
        performSegue(withIdentifier: "thirdViewControllerLink", sender: nil)
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
