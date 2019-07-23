//
//  ViewController.swift
//  Agenda-iOS
//
//  Created by administrador on 19/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var service: AutenticacaoService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = AutenticacaoService(delegate: self)
        
        self.loginButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func login(_ sender: Any) {
        if let email = self.emailTextField.text,
            let senha = self.senhaTextField.text,
            !email.isEmpty && !senha.isEmpty {
            
            self.service.postLogin(email: email, senha: senha)
        }
    }
    @IBAction func cadastrar(_ sender: Any) {
        
        let controller = StoryboardScene.Main.cadastroViewController.instantiate()
        
        self.present(controller, animated: true)
    }
}

extension ViewController: AutenticacaoServiceDelegate {
    func success() {
    
        ScreenManager.setupInitialViewController()
    }
    
    func failure(error: String) {
        print(error)
    }
}
