//
//  SecondViewController.swift
//  multihop app
//
//  Created by Jad on 3/10/17.
//  Copyright © 2017 Jad. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController {
    @IBOutlet var text: UILabel!
    @IBOutlet var reachable: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        reachable.isEnabled = false
        reachable.setOn(false, animated: false)
        
        if Reachability.isConnectedToNetwork() == true {
            reachable.setOn(true, animated: false)
            print(String(Reachability.IPaddress()))
        } else {
            reachable.setOn(false, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
