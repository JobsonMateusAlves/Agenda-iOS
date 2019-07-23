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
//        self.service.post
    }
    @IBAction func cadastrar(_ sender: Any) {
        
        let controller = StoryboardScene.Main.cadastroViewController.instantiate()
//        controller.delegate = self
        
        self.present(controller, animated: true)
    }
}

extension ViewController: AutenticacaoServiceDelegate {
    func success() {
        
    }
    
    func failure(error: String) {
        print(error)
    }
}

//extension ViewController: CadastroViewControllerDelegate {
//    
//    func cadastrado() {
//        
//        
//    }
//}
