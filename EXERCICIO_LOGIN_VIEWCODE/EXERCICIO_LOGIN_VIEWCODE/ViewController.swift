//
//  ViewController.swift
//  EXERCICIO_LOGIN_VIEWCODE
//
//  Created by SP11601 on 24/03/22.
//

import UIKit

class ViewController: UIViewController {

    // DADOS DE USUARIO ARMAZENADOS A SEREM CHECADOS
    let storedEmail = "brunao@email.com"
    let storedPassword = "abc123"
    
    var enteredEmail = ""
    var enteredPassword = ""
    
    var safeArea: UILayoutGuide!
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Bingo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.font = UIFont.systemFont(ofSize: 22)
        label.text = "User"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.placeholder = "ex.: yours@email.com"
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor

        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.clearButtonMode = .whileEditing
        
        textField.addTarget(self, action: #selector(getEmail), for: .editingChanged)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemPink
        label.font = UIFont.systemFont(ofSize: 22)
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.size.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.placeholder = "enter password"
        
        textField.borderStyle = .none
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor

        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        
        textField.addTarget(self, action: #selector(getPassword), for: .editingChanged)

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.setTitle("Forgot your password?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var goButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.setTitle("GO!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(validateLogin), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        safeArea = view.layoutMarginsGuide
        
        title = "Login"
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: (logoImageView.image?.size.height)! / 3),
            logoImageView.widthAnchor.constraint(equalToConstant: (logoImageView.image?.size.width)! / 3),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
                 
        view.addSubview(userLabel)
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            userLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
 
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ])

        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)
        ])

        view.addSubview(forgotPasswordButton)
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 17)
        ])
        
        view.addSubview(goButton)
        NSLayoutConstraint.activate([
            goButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 32),
            goButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goButton.heightAnchor.constraint(equalToConstant: 60),
            goButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
        
    @objc func validateLogin() {
            
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
            

        print("Cliquei no botao")
    }

    // CAPTURA O VALOR DO CAMPO DE TEXTO AO EDITAR O CAMPO
    @objc func getEmail(_ sender: UITextField) {
        enteredEmail = sender.text!
    }
    
    // CAPTURA O VALOR DO CAMPO DE TEXTO AO EDITAR O CAMPO
    @objc func getPassword(_ sender: UITextField) {
        enteredPassword = sender.text!
    }
    
    // VERIFICA O FORMATO DE ENTRADA DO EMAIL UTILIZANDO EXPRESSOES REGULARES
    func validateEmail(email: String) -> Bool {
        let regexEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", regexEmail)
        return emailPred.evaluate(with: email)
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
