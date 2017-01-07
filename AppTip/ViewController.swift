//
//  ViewController.swift
//  AppTip
//
//  Created by Simrandeep Singh on 12/16/16.
//  Copyright © 2016 Sim Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var percentageControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    // initial percentage options
    var percentages = [0.15, 0.18, 0.20]
    var defaults = NSUserDefaults.standardUserDefaults()
    var currency = "$"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // set the currency symbol in money vals
        tipLabel.text = String(format: "%@%@", currency, "0.00")
        totalLabel.text = String(format: "%@%@", currency, "0.00")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        billTextField.becomeFirstResponder()
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        defaults = NSUserDefaults.standardUserDefaults()
        let billVal = defaults.doubleForKey("billFieldVal")
        
        if( billVal != 0){
            billTextField.text = String(billVal)
        }
        
        let leftVal = defaults.integerForKey("leftFieldVal")
        let rightVal = defaults.integerForKey("rightFieldVal")
        let centerVal = defaults.integerForKey("centerFieldVal")
        
        percentages[0] = Double(leftVal) / 100
        percentages[1] = Double(centerVal) / 100
        percentages[2] = Double(rightVal) / 100
        
        percentageControl.setTitle((String(leftVal)+"%"), forSegmentAtIndex: 0)
        percentageControl.setTitle((String(centerVal)+"%"), forSegmentAtIndex: 1)
        percentageControl.setTitle((String(rightVal)+"%"), forSegmentAtIndex: 2)
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    /*
        hides keyboard when tapping outside it and not on any object
    */
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    /*
        Calculated tip and changes values on interface
 
        - param sender: object that was pressed; not used
    */
    @IBAction func calcTip(sender: AnyObject) {
        
        // get the value input into the bill
        let bill = Double(billTextField.text!) ?? 0
        
        // get the selected percentage
        let percent = percentages[percentageControl.selectedSegmentIndex]
        
        // amount of tip based on the bill and selected percentage
        let tip = bill * percent
        
        // calculate the total
        let total = bill * percent + bill
        
        // set the values on screen
        tipLabel.text = String(format: "%@%.2f", currency, tip)
        totalLabel.text = String(format: "%@%.2f", currency, total )
        
        // save bill value so it doesn't hide if app closes or settings
        defaults.setDouble(bill, forKey: "billFieldVal")
        
        // end function
        
        //code that I couldn't get working
        //var percentage = percentageControl.titleForSegmentAtIndex( percentageControl.selectedSegmentIndex )
        
        //percentage?.removeAtIndex(percentage!.endIndex)
        
        
        //let perc = Double(percentage!)
    }
}

