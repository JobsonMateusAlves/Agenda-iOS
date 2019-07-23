//
//  ContatoTableViewCell.swift
//  Agenda-iOS
//
//  Created by administrador on 23/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class ContatoTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var imageVIewContato: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var telefoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageVIewContato.layer.cornerRadius = self.imageVIewContato.frame.height/2
    }
    
    func bind(contato: ContatoView) {
        
        self.imageVIewContato.kf.setImage(with: URL(string: contato.picture))
        self.nomeLabel.text = contato.name
        self.telefoneLabel.text = contato.phone
    }
}
