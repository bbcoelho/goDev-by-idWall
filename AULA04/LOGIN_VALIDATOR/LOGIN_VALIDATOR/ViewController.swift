//
//  ViewController.swift
//  LOGIN_VALIDATOR
//
//  Created by SP11601 on 14/03/22.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var goButton: UIButton!

    // DADOS DE USUARIO ARMAZENADOS A SEREM CHECADOS
    let storedEmail = "brunao@email.com"
    let storedPassword = "abc123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userTextField.delegate = self
        passwordTextField.delegate = self
        
    }

    @IBAction func goButton(_ sender: UIButton) {
        if let enteredEmail = userTextField.text,
           let enteredPassword = passwordTextField.text {
            
            // VERIFICA SE O BOTAO FOI PRESSIONADO COM OS CAMPOS EM BRANCO
            if enteredEmail == "" || enteredPassword == "" {
                let alert = UIAlertController(title: nil, message: "Please, enter your E-MAIL and PASSWORD!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .destructive , handler: nil))
                present(alert, animated: true, completion: nil)
            }
            else {
                // VERIFICA SE O EMAIL TEM FORMATO VALIDO
                if validateEmail(email: enteredEmail) {
                    
                    // SE SIM, VERIFICA SE EMAIL E PASSWORD DIGITADOS ESTAO CORRETOS E APRESENTA RESULTADO DO LOGIN
                    if enteredEmail == storedEmail && enteredPassword == storedPassword {
                        let alert = UIAlertController(title: nil, message: "SUCCESS! 😃 Let's play!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
                        present(alert, animated: true, completion: nil)
                    }
                    else {
                        let alert = UIAlertController(title: nil, message: "Incorrect USER or PASSWORD", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .destructive , handler: nil))
                        present(alert, animated: true, completion: nil)
                        passwordTextField.text = ""
                    }
                }
                
                // SE FORMATO DE EMAIL INCORRETO, SOLICITA UM EMAIL COM FORMATO VALIDO
                else {
                    let alert = UIAlertController(title: nil, message: "Invalid E-MAIL format. Please, enter a valid E-MAIL", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .destructive , handler: nil))
                    present(alert, animated: true, completion: nil)
                    passwordTextField.text = ""
                }
            }
        }
        
        // VERIFICA O FORMATO DE ENTRADA DO EMAIL UTILIZANDO EXPRESSOES REGULARES
        func validateEmail(email: String) -> Bool {
            let regexEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
            let emailPred = NSPredicate(format: "SELF MATCHES %@", regexEmail)
            return emailPred.evaluate(with: email)
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    // HABILITA O BOTAO DE RETORNO DO TECLADO PARA SAIR DA EDICAO DOS CAMPOS
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // HABILITA A SAIDA DE EDICAO DOS CAMPOS CLICANDO EM QUALQUER LUGAR DA VIEW
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
