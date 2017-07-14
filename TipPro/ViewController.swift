//
//  ViewController.swift
//  TipPro
//
//  Created by Jennifer Gao on 11/7/2017.
//  Copyright © 2017 Jennifer Gao reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BillAmount: UITextField!
    @IBOutlet weak var tipsDisplay: UILabel!
    @IBOutlet weak var TipController: UISlider!
    @IBOutlet weak var TipAmount: UITextField!
    @IBOutlet weak var Total: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BillAmount.layer.borderWidth = 2
        BillAmount.layer.borderColor = UIColor.blue.cgColor
        print("ViewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getTip() -> Int
    {
        let tipPercentage = TipController.value
        tipsDisplay.text = "Tip% = " + String(Int(round(tipPercentage))) + "%"
        return Int(round(tipPercentage))
    }
    @IBAction func calculateTip(sender: AnyObject) {
        if let billString = BillAmount.text,
            billString != "",
            let billAmount = Double(billString) {
            //round method
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * Double(getTip())/100
            let roundedTipAmount = round(tipAmount)
            let totalAmount = roundedBillAmount + roundedTipAmount
                     if (!BillAmount.isEditing)
        {
            BillAmount.text = String(format: "%.2f", roundedBillAmount)
        }
            
        TipAmount.text = String(format: "%.2f", roundedTipAmount)
        Total.text = String(format: "%.2f", totalAmount)
            
        }
        else
        {
            //show error
              BillAmount.text = ""
            TipAmount.text = ""
            Total.text = ""
        }
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        calculateTip(sender: sender as AnyObject)
    }

}

