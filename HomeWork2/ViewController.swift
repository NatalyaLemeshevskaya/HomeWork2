//
//  ViewController.swift
//  HomeWork2
//
//  Created by Наташа Лемешевская on 11/15/19.
//  Copyright © 2019 Наташа Лемешевская. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

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
    

    let minValueSlider:Float = 0.0
    let maxValueSlider:Float = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumValue = minValueSlider
        redSlider.maximumValue = maxValueSlider
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = minValueSlider
        greenSlider.maximumValue = maxValueSlider
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumValue = minValueSlider
        blueSlider.maximumValue = maxValueSlider
        blueSlider.minimumTrackTintColor = .blue
        
        changeColor()
        changeValue(label: redLabel, textField: redTextField, slider: redSlider)
        changeValue(label: greenLabel, textField: greenTextField, slider: greenSlider)
        changeValue(label: blueLabel, textField: blueTextField, slider: blueSlider)
        
        redTextField.keyboardType = UIKeyboardType.decimalPad
        greenTextField.keyboardType = UIKeyboardType.decimalPad
        blueTextField.keyboardType = UIKeyboardType.decimalPad
        
        setDoneOnKeyboard(textFieldRed: redTextField, textFieldGreen: greenTextField, textFieldBlue: blueTextField)
    
    }

    
    private func changeValue(label: UILabel, textField: UITextField, slider: UISlider) {
        label.text = String(format: "%.2f", slider.value)
        textField.text = String(format: "%.2f", slider.value)
        
    }
    
    private func changeColor()  {

        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }

    @IBAction func redSliderAction() {
        changeColor()
        changeValue(label: redLabel, textField: redTextField, slider: redSlider)
    }
    
    @IBAction func greenSliderAction() {
        changeColor()
        changeValue(label: greenLabel, textField: greenTextField, slider: greenSlider)
    }
    
    @IBAction func blueSliderAction() {
        changeColor()
        changeValue(label: blueLabel, textField: blueTextField, slider: blueSlider)
    }

}

extension UIViewController: UITextFieldDelegate {
    
    func setDoneOnKeyboard(textFieldRed: UITextField, textFieldGreen: UITextField, textFieldBlue: UITextField) {
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

    @objc func dismissKeyboard() {
    view.endEditing(true)
 }

}



