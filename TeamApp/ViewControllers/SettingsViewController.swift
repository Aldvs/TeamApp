//
//  SettingsViewController.swift
//  TeamApp
//
//  Created by Ильяс on 07.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var delegate: SettingsLabeleAndViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 18
        colorView.backgroundColor = viewColor
        
    
        setSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        
        
    }
    
    
    // MARK: - IB Actions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        default:
            setValue(for: blueLabel)
            setValue(for: blueTextField)
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.setColor?(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    

    // MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for lable: UILabel...) {
        lable.forEach { lable in
            switch lable {
            case redLabel: lable.text = string(from: redSlider)
            case greenLabel: lable.text = string(from: greenSlider)
            default: lable.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textFields in
            switch textFields {
            case redTextField: textFields.text = string(from: redSlider)
            case greenTextField: textFields.text = string(from: greenSlider)
            default: textFields.text = string(from: blueSlider)
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: viewColor)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
    // MARK: - UITextFieldDelegate
//extension SettingsViewController: UITextFieldDelegate {
//
//}

