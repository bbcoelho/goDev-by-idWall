//
//  ViewController.swift
//  NAVIGATION_STORYBOARD
//
//  Created by SP11601 on 31/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "First View"
    }
    
    @IBAction func goToSecondView(_ sender: Any) {
        
        let dataToSend = "TESTE"
        
        performSegue(withIdentifier: "secondViewControllerLink", sender: dataToSend)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //👆👆👆👆👆
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "secondViewControllerLink" {
            
            print("passei aqui")
            
            if let thirdViewControllerLink = segue.destination as? ThirdViewController {
                
                thirdViewControllerLink.data = sender as? String
                
                print("Tentando passar o dado direto para a terceira view")
                
                // NAO FUNCIONA POIS NAO EXISTE LIGACAO ENTRE A PRIMEIRA E TERCEIRA VIEWS
                
            }
            
        }
    }


}

