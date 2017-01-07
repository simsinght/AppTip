//
//  SettingsViewController.swift
//  AppTip
//
//  Created by Simrandeep Singh on 1/6/17.
//  Copyright © 2017 Sim Singh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var leftUITextField: UITextField!
    
    @IBOutlet weak var centerUITextField: UITextField!
    
    @IBOutlet weak var rightUITextField: UITextField!
    
    var leftFieldValue = "15%"
    var centerFieldValue = "18%"
    var rightFieldValue = "20%"
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = NSUserDefaults.standardUserDefaults()
        // Do any additional setup after loading the view.
        
        // set value to current value of left field
        let leftKey = defaults.integerForKey("leftFieldVal") ?? 15
        leftUITextField.text = String(leftKey)
        
        // set value to current value of right field
        let centerKey = defaults.integerForKey("centerFieldVal") ?? 18
        centerUITextField.text = String(centerKey)
        
        // set value to current value of right field
        let rightKey = defaults.integerForKey("rightFieldVal") ?? 20
        rightUITextField.text = String(rightKey)
    }
    
    
    /*override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }*/

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        when done editing the field; change the default values
    */
    @IBAction func editRightField(sender: AnyObject) {
        
        let intVal = Int(rightUITextField.text!) ?? 0
        
        
        // set value to current value of right field
        defaults.setInteger(intVal, forKey: "rightFieldVal")
        
        // add % for aesthetic  // jk trying something else
        // rightUITextField.text = rightUITextField.text! + "%"
        
        //says don't after ios8
        //defaults.synchronize()
        
    }

    
    /*
     when done editing the field; change the default values
     */
    @IBAction func editCenterField(sender: AnyObject) {
        
        let intVal = Int(centerUITextField.text!) ?? 0
        
        // set value to current value of right field
        defaults.setInteger(intVal, forKey: "centerFieldVal")
        
        // add % for aesthetic // jk trying something else
        // centerUITextField.text = centerUITextField.text! + "%"
        
        //says don't after ios8
        //defaults.synchronize()
        
    }

    
    /*
     when done editing the field; change the default values
     */
    @IBAction func editLeftField(sender: AnyObject) {
        
        let intVal = Int(leftUITextField.text!) ?? 0
        
        // set value to current value of left field
        defaults.setInteger(intVal, forKey: "leftFieldVal")
        
        // add % for aesthetic // jk trying something else
        //leftUITextField.text = leftUITextField.text! + "%"
        
        //says don't after ios8
        //defaults.synchronize()
        
    }

    
    /*
     hides keyboard when tapping outside it and not on any object
     */
    //@IBAction func onTap(sender: AnyObject) {
    //    view.endEditing(true)
    //}
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
