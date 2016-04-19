//
//  MemeDetailViewController.swift
//  memekss
//
//  Created by Kathleen Stukenborg on 4/10/16.
//  Copyright © 2016 Kathleen Stukenborg. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController : UIViewController {
    
    var displayMeme: Meme!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.memeImage!.image = displayMeme.memedImage
        
            }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    
}
