//
//  ScreenManager.swift
//  Agenda-iOS
//
//  Created by administrador on 22/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import UIKit

class ScreenManager {
    
    static func setupInitialViewController() {
        
        if SessionControl.isSessionActive {
            
            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: StoryboardScene.Contatos.contatosViewController.instantiate())
        } else {
            UIApplication.shared.keyWindow?.rootViewController = StoryboardScene.Main.viewController.instantiate()
        }
    }
}
