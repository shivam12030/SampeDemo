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
        self.getUserProfileData(name: "Shivam")
        buttonCenterConstarint.isActive = true
        buttonBottomConstraint.isActive = false
        // Do any additional setup after loading the view.
    }
    
      // MARK: - User profile
    func getUserProfileData(name: String) {
        print("The user name is: \(name)")
    }
}
