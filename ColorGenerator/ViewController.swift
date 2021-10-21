//
//  ViewController.swift
//  ColorGenerator
//
//  Created by Raul Shafigin on 21.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    override var shouldAutorotate: Bool{
        return false
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        sliderRed.value = 0
        sliderRed.minimumTrackTintColor = .red
        
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        sliderGreen.value = 0
        sliderGreen.minimumTrackTintColor = .green
        
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        sliderBlue.value = 0
        sliderBlue.minimumTrackTintColor = .blue
    }
    
    func generateNewColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1.0)
    }
    @IBAction func redSliderAct() {
        redValueLabel.text = String(format: "%.2f", sliderRed.value)
        generateNewColor()
    }
    
    @IBAction func greenSliderAct() {
        greenValueLabel.text = String(format: "%.2f", sliderGreen.value)
        generateNewColor()
    }
    
    @IBAction func blueSliderAct() {
        
        blueValueLabel.text = String(format: "%.2f", sliderBlue.value)
        generateNewColor()
    }
    
}



