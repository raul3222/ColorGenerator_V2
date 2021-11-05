//
//  ViewController.swift
//  ColorGenerator
//
//  Created by Raul Shafigin on 21.10.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redColorTF: UITextField! {
        didSet {
            redColorTF.addDoneToolbar(onDone: (target: self, action: #selector(doneButtonTappedForMyNumericTextField)))
        }
    }
    @IBOutlet var greenColorTF: UITextField! {
        didSet {
            greenColorTF.addDoneToolbar(onDone: (target: self, action: #selector(doneButtonTappedForMyNumericTextField)))
        }
    }
    @IBOutlet var BlueColorTF: UITextField! {
        didSet {
            BlueColorTF.addDoneToolbar(onDone: (target: self, action: #selector(doneButtonTappedForMyNumericTextField)))
        }
    }
    
    var bgColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
       
        redColorTF.delegate = self
        greenColorTF.delegate = self
        BlueColorTF.delegate = self
        
        colorView.backgroundColor = bgColor
       
        initializeSliders()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        changeColor()
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setColor(viewColor: colorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    @objc func doneButtonTappedForMyNumericTextField() {
        redColorTF.resignFirstResponder()
        greenColorTF.resignFirstResponder()
        BlueColorTF.resignFirstResponder()
    }
   private func initializeLabels(with red: Float, green: Float, blue: Float){
        redValue.text = String(format: "%.2f", red)
        greenValue.text = String(format: "%.2f", green)
        blueValue.text = String(format: "%.2f", blue)
    }
    
    private func initializeTextFields(){
        redColorTF.text = redValue.text
        greenColorTF.text = greenValue.text
        BlueColorTF.text = blueValue.text
    }
    
    private func initializeSliders() {
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var red: CGFloat = 0
        var alfa: CGFloat = 0
        
        bgColor.getRed(&red, green: &green, blue: &blue, alpha: &alfa)
        
        initializeLabels(with: Float(red), green: Float(green), blue: Float(blue))
        
        redSlider.value = Float(redValue.text!) ?? 0
        greenSlider.value = Float(greenValue.text!) ?? 0
        blueSlider.value = Float(blueValue.text!) ?? 0
        
        initializeTextFields()
    }

    private func changeColor(){
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        initializeLabels(with: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
        
        initializeTextFields()
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == redColorTF {
        redValue.text = textField.text
        redSlider.value = Float(redValue.text!) ?? 0
        } else if textField == greenColorTF {
            greenValue.text = textField.text
            greenSlider.value = Float(greenValue.text!) ?? 0
        } else {
            blueValue.text = textField.text
            blueSlider.value = Float(blueValue.text!) ?? 0
        }
        changeColor()
    }
}

extension UITextField {
    func addDoneToolbar(onDone: (target: Any, action: Selector)? = nil) {
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    @objc func doneButtonTapped() { self.resignFirstResponder() }
}

