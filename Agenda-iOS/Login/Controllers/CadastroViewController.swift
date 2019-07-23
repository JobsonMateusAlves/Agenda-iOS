//
//  CadastroViewController.swift
//  Agenda-iOS
//
//  Created by administrador on 22/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import UIKit

//protocol CadastroViewControllerDelegate {
//
//    func cadastrado()
//}


class CadastroViewController: UIViewController {
    @IBOutlet weak var emalTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var confirmacaoTextField: UITextField!
    
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var cancelarButton: UIButton!
    
    var service: AutenticacaoService!
//    var delegate: CadastroViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = AutenticacaoService.init(delegate: self)
    }
    @IBAction func cancelar(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    @IBAction func cadastrar(_ sender: Any) {
        
        if let email = self.emalTextField.text,
           let senha = self.senhaTextField.text,
           let confirmacao = self.confirmacaoTextField.text,
           !email.isEmpty && !senha.isEmpty && !confirmacao.isEmpty {
            
            self.service.postCadastro(email: email, senha: senha, confirmacaoSenha: confirmacao)
        }
    }
}

extension CadastroViewController: AutenticacaoServiceDelegate {
    func success() {
        
        self.dismiss(animated: true) {
            ScreenManager.setupInitialViewController()
        }
    }
    
    func failure(error: String) {
        print(error)
    }
}
