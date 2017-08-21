//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Mark Lagusker on 8/18/17.
//  Copyright © 2017 Mark Lagusker. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var leftPercField: UITextField!
    @IBOutlet weak var midPercField: UITextField!
    @IBOutlet weak var rightPercField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        if(defaults.array(forKey: "percentDefaultValues") == nil){
            let percentDefaultValues: [Int] = [18,20,25]
            defaults.set(percentDefaultValues, forKey: "percentDefaultValues")
            defaults.synchronize()
        }else{
            let defaultPerc = defaults.array(forKey: "percentDefaultValues")!
            leftPercField.placeholder = String(describing: defaultPerc[0])
            midPercField.placeholder = String(describing: defaultPerc[1])
            rightPercField.placeholder = String(describing: defaultPerc[2])
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }


    @IBAction func setLeftField(_ sender: Any) {
        let left = Int(leftPercField.text!) ?? 0
        storeDefaults(value: left, index: 0)
    }

    @IBAction func setMidField(_ sender: Any) {
        let mid = Int(midPercField.text!) ?? 0
        storeDefaults(value: mid, index: 1)
    }
    @IBAction func setRightField(_ sender: Any) {
        let right = Int(rightPercField.text!) ?? 0
        storeDefaults(value: right, index: 2)
    }
    
    func storeDefaults(value: Int, index: Int) {
        let defaults = UserDefaults.standard
        var defaultPerc = defaults.array(forKey: "percentDefaultValues")!
        defaultPerc[index] = value
        defaults.set( defaultPerc, forKey: "percentDefaultValues")
        defaults.synchronize()
    }
}
