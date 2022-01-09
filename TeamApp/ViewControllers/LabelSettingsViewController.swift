//
//  LabelSettingsViewController.swift
//  TeamApp
//
//  Created by Дарья Носова on 07.01.2022.
//

import UIKit

class LabelSettingsViewController: UIViewController {
  
  // MARK: - IB Outlets
  @IBOutlet var redLabel: UIView!
  @IBOutlet var orangeLabel: UIView!
  @IBOutlet var yellowLabel: UIView!
  @IBOutlet var greenLabel: UIView!
  @IBOutlet var blueLabel: UIView!
  @IBOutlet var purpleLabel: UIView!
  @IBOutlet var pinkLabel: UIView!
  
  @IBOutlet var redSwitch: UISwitch!
  @IBOutlet var orangeSwitch: UISwitch!
  @IBOutlet var yellowSwitch: UISwitch!
  @IBOutlet var greenSwitch: UISwitch!
  @IBOutlet var blueSwitch: UISwitch!
  @IBOutlet var purpleSwitch: UISwitch!
  @IBOutlet var pinkSwitch: UISwitch!
  @IBOutlet var segmentedControl: UISegmentedControl!
  
  // MARK: - Public Properties
  var delegate: SettingsLabeleAndViewControllerDelegate!
  var backgroundColor: UIColor?
  var fontColor: UIColor?
  var backgroundSwitch: UISwitch?
  var fontSwitch: UISwitch?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    redLabel.layer.cornerRadius = 4
    orangeLabel.layer.cornerRadius = 4
    yellowLabel.layer.cornerRadius = 4
    greenLabel.layer.cornerRadius = 4
    blueLabel.layer.cornerRadius = 4
    purpleLabel.layer.cornerRadius = 4
    pinkLabel.layer.cornerRadius = 4
    
    setSwitchesforBackground(backgroundColor)
  }
  
  // MARK: - IB Actions
  @IBAction func segmentedControlAction() {
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      backgroundSwitch?.isOn = true
      offOtherSwitches(backgroundSwitch)
      setSwitchesforBackground(backgroundColor)
    default:
      fontSwitch?.isOn = true
      offOtherSwitches(fontSwitch)
      setSwitchesforText(fontColor)
    }
  }
  
  @IBAction func switchesAction(_ sender: UISwitch) {
    var selectedColor: UIColor!
    
    offOtherSwitches(sender)
        switch sender {
        case redSwitch:
          selectedColor = .red
          redSwitch.onTintColor = .red
        case orangeSwitch:
          selectedColor = .orange
          orangeSwitch.onTintColor = .orange
        case yellowSwitch:
          selectedColor = .yellow
          yellowSwitch.onTintColor = .yellow
        case greenSwitch:
          selectedColor = .green
          greenSwitch.onTintColor = .green
        case blueSwitch:
          selectedColor = .blue
          blueSwitch.onTintColor = .blue
        case purpleSwitch:
          selectedColor = .purple
          purpleSwitch.onTintColor = .purple
        case pinkSwitch:
          selectedColor = .systemPink
          pinkSwitch.onTintColor = .systemPink
        default:  break
        }
    
        switch segmentedControl.selectedSegmentIndex {
        case 0:
          backgroundColor = selectedColor
          backgroundSwitch = sender
        default:
          fontColor = selectedColor
          fontSwitch = sender
        }
    }
  
  
  @IBAction func saveButtonPressed() {
    delegate?.setColors?(fontColor ?? .black, backgroundColor ?? .white)
    dismiss(animated: true)
  }
  
}

// MARK: - Private Methods
extension LabelSettingsViewController {
  
  private func offOtherSwitches (_ choosenSwitch: UISwitch?){
    if choosenSwitch != redSwitch {
      redSwitch.isOn = false
    }
    if choosenSwitch != orangeSwitch {
      orangeSwitch.isOn = false
    }
    if choosenSwitch != yellowSwitch {
      yellowSwitch.isOn = false
    }
    if choosenSwitch != greenSwitch {
      greenSwitch.isOn = false
    }
    if choosenSwitch != blueSwitch {
      blueSwitch.isOn = false
    }
    if choosenSwitch != purpleSwitch {
      purpleSwitch.isOn = false
    }
    if choosenSwitch != pinkSwitch {
      pinkSwitch.isOn = false
    }
  }
  
  private func setSwitchesforBackground ( _ backgroundColor: UIColor?) {
    switch backgroundColor {
    case UIColor.red:
      redSwitch.isOn = true
      redSwitch.onTintColor = .red
    case UIColor.orange:
      orangeSwitch.isOn = true
      orangeSwitch.onTintColor = .orange
    case UIColor.yellow:
      yellowSwitch.isOn = true
      yellowSwitch.onTintColor = .yellow
    case UIColor.green:
      greenSwitch.isOn = true
      greenSwitch.onTintColor = .green
    case UIColor.blue:
      blueSwitch.isOn = true
      blueSwitch.onTintColor = .blue
    case UIColor.purple:
      purpleSwitch.isOn = true
    case UIColor.systemPink:
      pinkSwitch.isOn = true
      purpleSwitch.onTintColor = .purple
    default:
      offOtherSwitches(nil)
    }
  }
  
  private func setSwitchesforText ( _ textColor: UIColor?) {
    switch textColor {
    case UIColor.red:
      redSwitch.isOn = true
      redSwitch.onTintColor = .red
    case UIColor.orange:
      orangeSwitch.isOn = true
      orangeSwitch.onTintColor = .orange
    case UIColor.yellow:
      yellowSwitch.isOn = true
      yellowSwitch.onTintColor = .yellow
    case UIColor.green:
      greenSwitch.isOn = true
      greenSwitch.onTintColor = .green
    case UIColor.blue:
      blueSwitch.isOn = true
      blueSwitch.onTintColor = .blue
    case UIColor.purple:
      purpleSwitch.isOn = true
      purpleSwitch.onTintColor = .purple
    case UIColor.systemPink:
      pinkSwitch.isOn = true
      pinkSwitch.onTintColor = .systemPink
    default:
      break
    }
  }
  
}
