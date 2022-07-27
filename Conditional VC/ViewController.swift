//
//  ViewController.swift
//  Conditional VC
//
//  Created by Adrian Richton Co on 7/27/22.
//

import UIKit

class ViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    var conSegue:Bool?
    var stringSegue: String?
    
    @IBOutlet weak var stringLabel: UILabel!
    @IBOutlet weak var boolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cond = defaults.string(forKey: "SegueConditional") { // Access UserDefault
            stringSegue = cond
        }
        
        conSegue = Bool(stringSegue ?? "true")
        print(stringSegue!)
        print(conSegue!)
        stringLabel.text = "String: \(stringSegue!)"
        boolLabel.text = "Bool: \(conSegue!)"
//        stringSegue = "false"
        self.defaults.set(stringSegue, forKey: "SegueConditional")
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        if conSegue == true{
            performSegue(withIdentifier: "goToA", sender: self)
        }
        else{
            performSegue(withIdentifier: "goToB", sender: self)
        }
    }
    
}

