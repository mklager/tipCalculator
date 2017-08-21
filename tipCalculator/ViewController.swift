//
//  ViewController.swift
//  tipCalculator
//
//  Created by Mark Lagusker on 8/17/17.
//  Copyright © 2017 Mark Lagusker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tipPercentages = defaults.array(forKey: "percentDefaultValues")!
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * ((tipPercentages[tipControl.selectedSegmentIndex] as? Double)! / 100)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultPerc = defaults.array(forKey: "percentDefaultValues")!

        tipControl.setTitle(String(describing: defaultPerc[0]) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(describing: defaultPerc[1]) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(describing: defaultPerc[2]) + "%", forSegmentAt: 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateTip(self)
    }
}
