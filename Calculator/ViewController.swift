//
//  ViewController.swift
//  Calculator
//
//  Created by Saltanat Nareshova on 03.02.2021.
//

import UIKit

class ViewController: UIViewController {
    var numberOnLabel: Double=0;
    var previousN:Double = 0;
    var performMath = false;
    var operation = 0;
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performMath == true{
            label.text = String(sender.tag-1)
            numberOnLabel = Double(label.text!)!;
            performMath = false;
        }
        else{
            label.text=label.text!+String(sender.tag-1)
            numberOnLabel = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousN = Double(label.text!)!
            if sender.tag==12{
                label.text="/";
            }
            else if sender.tag==13{
                label.text="*";
            }
            else if sender.tag==14{
                label.text="-";
            }
            else if sender.tag==15{
                label.text="+";
            }
            operation=sender.tag
            performMath=true;
        }
        else if sender.tag == 16 {
            if operation == 12 {
                label.text = String(previousN / numberOnLabel);
            }
            else if operation == 13 {
                label.text = String(previousN * numberOnLabel);
            }
            else if operation == 14 {
                label.text = String(previousN - numberOnLabel);
            }
            else if operation == 15 {
                label.text = String(previousN + numberOnLabel);
            }
        }
        else if sender.tag == 11{
            label.text="";
            previousN = 0;
            numberOnLabel = 0;
            operation = 0;
        }
        
        
    }
    var displayValue: Double {
        get{
            return Double(label.text!)!
        }
        set{
            label.text = String(newValue)
        }
    }
   
    
    @IBAction func operationPressed(_ sender: UIButton) {
        switch sender.currentTitle!{
            case "∏":
                displayValue = Double.pi
            case "e":
                displayValue = M_E
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

