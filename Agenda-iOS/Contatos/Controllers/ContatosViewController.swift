//
//  ContatosViewController.swift
//  Agenda-iOS
//
//  Created by administrador on 22/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import UIKit
import SVProgressHUD

class ContatosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var contatos: [ContatoView] = []
    
    var service: ContatosService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = L10n.Contatos.title
        self.setupCreateButton()
        
        self.service = ContatosService(delegate: self)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(cellType: ContatoTableViewCell.self)
        
        self.loadData()
    }
    
    func loadData() {
        
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show()
        self.service.getContatos()
    }
    
    func setupCreateButton() {
        
        let button = UIBarButtonItem(image: Asset.createIcon.image, style: .done, target: self, action: #selector(ContatosViewController.openCreate))
        self.navigationController?.navigationItem.leftBarButtonItem = button
    }
    
    @objc func openCreate() {
        
    }
}

extension ContatosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath) as ContatoTableViewCell
        
        cell.bind(contato: self.contatos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
}

extension ContatosViewController: ContatosServiceDelegate {
    
    func success() {
        
        self.contatos = ContatoViewModel.getContatos()
        self.tableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func failure(error: String) {
        print(error)
        SVProgressHUD.dismiss()
    }
}
