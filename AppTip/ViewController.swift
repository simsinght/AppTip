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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calcTip(sender: AnyObject) {
        let percentages = [0.15, 0.18, 0.20]
        let bill = Double(billTextField.text!) ?? 0
        
        let percent = percentages[percentageControl.selectedSegmentIndex]
        let tip = bill * percent
        
        
        //var percentage = percentageControl.titleForSegmentAtIndex( percentageControl.selectedSegmentIndex )
        
        //percentage?.removeAtIndex(percentage!.endIndex)
        
        
        //let perc = Double(percentage!)
        
        let total = bill * percent + bill
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total )
    }
}

