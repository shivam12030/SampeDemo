//
//  SizeClassVC.swift
//  DisplayUseListProject
//
//  Created by Neosoft on 03/07/24.
//

import UIKit

class SizeClassVC: UIViewController {
    
    @IBOutlet weak var buttonCenterConstarint: NSLayoutConstraint!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        buttonCenterConstarint.isActive = true
        buttonBottomConstraint.isActive = false
        // Do any additional setup after loading the view.
    }
}
