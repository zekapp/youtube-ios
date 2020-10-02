//
//  ViewController.swift
//  youtube-ios
//
//  Created by Zeki Guler on 28/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }
    
    
}

