//
//  SettingViewController.swift
//  HomeWork2
//
//  Created by Наташа Лемешевская on 11/15/19.
//  Copyright © 2019 Наташа Лемешевская. All rights reserved.
//

import UIKit

protocol ColorProtocol {
    var color: UIColor { get }
}

protocol SettingViewControllerDelegate {
    func changeColor(_ color: UIColor)
}

class SettingViewController: UIViewController{
    
   // var color: UIColor

    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var colorView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        changeColor()
        changeValue(slider: redSlider)
        changeValue(slider: greenSlider)
        changeValue(slider: blueSlider)
        
        redTextField.keyboardType = UIKeyboardType.decimalPad
        greenTextField.keyboardType = UIKeyboardType.decimalPad
        blueTextField.keyboardType = UIKeyboardType.decimalPad
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    
        
        setDoneOnKeyboard(textFieldRed: redTextField, textFieldGreen: greenTextField, textFieldBlue: blueTextField)
            
    }

    
    private func changeValue(slider: UISlider) {
        switch slider.tag {
        case 0:
            redLabel.text = String(format: "%.2f", slider.value)
            redTextField.text = String(format: "%.2f", slider.value)
        case 1:
            greenLabel.text = String(format: "%.2f", slider.value)
            greenTextField.text = String(format: "%.2f", slider.value)
        case 2:
            blueLabel.text = String(format: "%.2f", slider.value)
            blueTextField.text = String(format: "%.2f", slider.value)
        default:
            return
        }
    }
    
    private func changeColor()  {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        changeColor()
        switch sender.tag {
        case 1: changeValue(slider: redSlider)
        case 2: changeValue(slider: greenSlider)
        case 3: changeValue(slider: blueSlider)
        default:
            return
        }
    }
    
}

extension SettingViewController {
        
    private  func setDoneOnKeyboard(textFieldRed: UITextField, textFieldGreen: UITextField, textFieldBlue: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self,
                                            action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        
        textFieldRed.inputAccessoryView = keyboardToolbar
        textFieldGreen.inputAccessoryView = keyboardToolbar
        textFieldBlue.inputAccessoryView = keyboardToolbar
        
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         dismissKeyboard()
     }

     @objc func dismissKeyboard() {
       view.endEditing(true)
    }
    
    private func showErrorAlert(){
        let alert = UIAlertController(title: "Wrong number", message: "The value should be between 0 and 1", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    
}

extension SettingViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        if let textForSlider = Float(text){
            if 0...1 ~= textForSlider{
        switch textField.tag {
        case 0:
            redSlider.value = textForSlider
            changeValue(slider: redSlider)
            changeColor()
        case 1:
            greenSlider.value = textForSlider
            changeValue(slider: greenSlider)
            changeColor()
        case 2:
            blueSlider.value = textForSlider
            changeValue(slider: blueSlider)
            changeColor()
        default:
            return
                }
            }else {
                showErrorAlert()
                
            }
       }
    }
}



