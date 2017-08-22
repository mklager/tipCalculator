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
    @IBOutlet weak var dividerView: UIView!
    
    
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
        
        setTitles(tip: tip, total: total)
        
        //store bill amount and current timestamp
        let timeOfLastBill = NSDate().timeIntervalSince1970
        defaults.set([bill, timeOfLastBill], forKey: "lastBill")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dividerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
        self.dividerView.alpha = 1
        })
        
        let defaults = UserDefaults.standard
        let defaultPerc = defaults.array(forKey: "percentDefaultValues")!

        tipControl.setTitle(String(describing: defaultPerc[0]) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(describing: defaultPerc[1]) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(describing: defaultPerc[2]) + "%", forSegmentAt: 2)
        
        //show last bill if <10 min
        if(defaults.array(forKey: "lastBill") != nil ){
            let lastBill = defaults.array(forKey: "lastBill")!
            let lastBillTime = lastBill[1] as? Double
            let lastBillAmount = lastBill[0] as? Int
            let curTime = NSDate().timeIntervalSince1970
            if((curTime - lastBillTime!) < 60 && lastBillAmount! > Int(0)){
                billField.text = String(describing: lastBillAmount!)
            }
        }
        
        setTitles(tip: 0.00, total: 0.00)
        
        //set bill amount as first responder
        self.billField.becomeFirstResponder()
        
        //set background
        if(defaults.bool(forKey: "theme")){
            self.view.backgroundColor = UIColor.darkGray
        }else{
            self.view.backgroundColor = UIColor.white
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateTip(self)//recalculate tip in case percentage has changed
    }
    
    //use locale-specific currency and currency thousands separators
    func setTitles(tip: Double, total: Double){
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        let formattedTipAmount = formatter.string(from: tip as NSNumber)
        let formattedTotalAmount = formatter.string(from: total as NSNumber)
        tipLabel.text = formattedTipAmount
        totalLabel.text = formattedTotalAmount
        
        return
    }
    
    
}
