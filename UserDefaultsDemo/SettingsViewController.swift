//
//  SettingsViewController.swift
//  UserDefaultsDemo
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import UIKit



class SettingsViewController: UITableViewController {
  
  @IBOutlet weak var unitMeasurementLabel: UILabel!
  
  @IBOutlet weak var runBikeImageView: UIImageView!
  
  var currentUnit = UnitMeasurement.miles {
    didSet {
      // update the untMeasurement Label
      unitMeasurementLabel.text = currentUnit.rawValue  // "Miles or "Kilometers"
      
      // update value in user defaults
      UserPreference.shared.updateUnitMeasurement(with: currentUnit)
      
    }
  }
  
  var currentPhoto = Activity.bike {
    didSet {
      runBikeImageView.image = UIImage(named: currentPhoto.rawValue)
      
      UserPreference.shared.updateActivity(with: currentPhoto)
    }
  }
  
  var backgroundColor = Background.orange {
    didSet {
      updateBKGD()
      
      UserPreference.shared.updateBackgroundColor(with: backgroundColor)
    }
  }
  
  private func updateBKGD() {
    switch backgroundColor {
    case .orange:
      view.backgroundColor = .orange
    case .blue:
      view.backgroundColor = .blue
    default:
      view.backgroundColor = .purple
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
    
  }
  
  private func updateUI() {
    // retrieve any values in UserDefaults as needed
    if let unitMeasurement = UserPreference.shared.getUnitMeasurement() {
      currentUnit = unitMeasurement
    }
    
    if let activity = UserPreference.shared.getActivity() {
      currentPhoto = activity
    }
    
    if let color = UserPreference.shared.getBackgroundColor() {
      backgroundColor = color
    } else {
      print("nil color")
    }
  }
  
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    // toggle between "Miles" and "Kilometers"
    switch indexPath.row {
    case 0:
      // toggle unitMeasurementLabel
      toggleUnitMeasurement()
    case 1:
      toggleBikeRunPhoto()
    case 2:
      toggleBackgroundColor()
    default:
      break
    }
  }
  private func toggleUnitMeasurement() {
    // current unit equals current  unit - if current unit equals miles change to kilometers else change to miles
    currentUnit = (currentUnit == UnitMeasurement.miles) ? UnitMeasurement.kilometers : UnitMeasurement.miles
  }
  
  private func toggleBikeRunPhoto() {
    currentPhoto = (currentPhoto == Activity.bike) ? Activity.run : Activity.bike
  }
  
  private func toggleBackgroundColor() {
    backgroundColor = (backgroundColor == Background.blue) ? Background.orange : Background.blue
  }
}
