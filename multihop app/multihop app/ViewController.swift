//
//  ViewController.swift
//  multihop app
//
//  Created by Jad on 3/8/17.
//  Copyright © 2017 Jad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var logo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.logo.image = UIImage(named: "logo")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

