//
//  ViewController.swift
//  Multiply-Connor
//
//  Created by Connor Reed on 9/21/21.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var num1Input: UITextField!
    @IBOutlet weak var num2Input: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operatorSelect: UISegmentedControl!
    @IBOutlet weak var num1Slider: UISlider!
    @IBOutlet weak var num2Slider: UISlider!
    var operatorNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.num1Slider.value = 10.0
        self.num2Slider.value = 10.0
        // Do any additional setup after loading the view.
    }
    @IBAction func calculate(_ sender: Any) {
        let num1 = Int(self.num1Input.text!) ?? 0
        let num2 = Int(self.num2Input.text!) ?? 0
        var result = 0
        switch self.operatorNum{
        case 0:
            result = num1 * num2
            break
        case 1:
            result = num1 / num2
            break
        case 2:
            result = num1 - num2
            break
        case 3:
            result = num1 + num2
            break
        case 4:
            result = num1 % num2
        default:
            return
        }
        self.resultsLabel.text = "Results: \(String(result))"
        if(result == 64){
            let img = UIImage(named: "jeb")
            self.image.image = img
        } else if(result % 2 == 0){
            let img = UIImage(named: "a funny photo 2")
            self.image.image = img
        } else {
            let img = UIImage(named: "an even funnier photo 2")
            self.image.image = img

        }
        view.endEditing(true)
    }
    @IBAction func clear(_ sender: Any) {
        self.num1Input.text = ""
        self.num2Input.text = ""
        self.num1Slider.value = 0.0
        self.num2Slider.value = 0.0
        self.resultsLabel.text = "Results: Not Run Yet"
        self.image.image = nil
    }
    @IBAction func operatorChanged(_ sender: Any) {
        let selected = operatorSelect.selectedSegmentIndex
        let operators = ["×", "÷", "-", "+", "%"]
        self.operatorLabel.text = operators[selected]
        self.operatorNum = selected
        
    }
    @IBAction func num1SliderChanged(_ sender: Any) {
        num1Input.text = String(Int(num1Slider.value))
    }
    @IBAction func num2SliderChanged(_ sender: Any) {
        num2Input.text = String(Int(num2Slider.value))
    }
    @IBAction func num1FieldChanged(_ sender: Any) {
        self.num1Slider.value = Float(self.num1Input.text ?? "0") ?? 0.0
    }
    @IBAction func num2FieldChanged(_ sender: Any) {
        self.num2Slider.value = Float(self.num2Input.text ?? "0") ?? 0.0
    }
    

}

