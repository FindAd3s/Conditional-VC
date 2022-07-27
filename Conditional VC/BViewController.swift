//
//  BViewController.swift
//  Conditional VC
//
//  Created by Adrian Richton Co on 7/27/22.
//

import UIKit

class BViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    var conSegue:Bool?
    var stringSegue: String?
    
    @IBOutlet weak var tutorialSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cond = defaults.string(forKey: "SegueConditional") { // Access UserDefault
            stringSegue = cond
        }
        
        conSegue = Bool(stringSegue ?? "true")
        print(stringSegue!)
        print(conSegue!)
        if conSegue == true{
            tutorialSwitch.isOn = true
        }
        else if conSegue == false{
            tutorialSwitch.isOn = false
        }
//        stringSegue = "false"
        self.defaults.set(stringSegue, forKey: "SegueConditional")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if sender.isOn{
            stringSegue = "true"
            self.defaults.set(stringSegue, forKey: "SegueConditional")
        }
        else{
            stringSegue = "false"
            self.defaults.set(stringSegue, forKey: "SegueConditional")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func mainMenuSegueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMain", sender: self)
    }
}
