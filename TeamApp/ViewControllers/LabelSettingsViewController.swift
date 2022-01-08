//
//  LabelSettingsViewController.swift
//  TeamApp
//
//  Created by Дарья Носова on 07.01.2022.
//

import UIKit

class LabelSettingsViewController: UIViewController {
  
  // MARK: - IB Outlets
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
  
  // MARK: - IB Actions
  @IBAction func segmentedControlAction() {
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      offOtherSwitches(nil)
    default:
      offOtherSwitches(nil)
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
        default:
          selectedColor = .systemPink
          pinkSwitch.onTintColor = .systemPink
        }
    
        switch segmentedControl.selectedSegmentIndex {
        case 0:
          backgroundColor = selectedColor
        default:
          fontColor = selectedColor
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
    if choosenSwitch !== orangeSwitch {
      orangeSwitch.isOn = false
    }
    if choosenSwitch !== yellowSwitch {
      yellowSwitch.isOn = false
    }
    if choosenSwitch !== greenSwitch {
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
  
}
