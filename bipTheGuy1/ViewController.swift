//
//  ViewController.swift
//  bipTheGuy1
//
//  Created by Lily Copeland on 2/19/20.
//  Copyright © 2020 Lily Copeland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageToView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        print("Hey you just pressed the image!")
    }
    
    
    
    
    
    
    
    
}

