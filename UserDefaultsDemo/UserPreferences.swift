//
//  UserPreferences.swift
//  UserDefaultsDemo
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation
import UIKit

enum Activity: String {
  case run = "run"
  case bike = "bike"
}

enum UnitMeasurement: String {
  case miles = "Miles"
  case kilometers = "Kiolometers"
}


enum Background: String {
  case white = "White"
  case blue = "Blue"
  case orange = "Orange"
}

struct UserPreferenceKey {
  static let unitMeasurement = "Unit Measurement"
  static let activity = "Activity"
  static let backgroundColor = "Background Color"
}

class UserPreference {
  
  // a Singleton initializer NEEDS to be privste - this ensures that only one
  //      instance of this class is used throughout the sapplication
  
  private init() {}
  
  //private let standard = UserDefaults.standard
  
  static let shared = UserPreference()
  // UserPreference() - no longer allowed becsuse of private init()
  
  // set user defaults value (object)
  func updateUnitMeasurement(with unit: UnitMeasurement) {
    // storing or persisting the unit measurement value to UserDefaults (device or similar as permenant storage
    
    //UserDefaults.standard is a Singleton in iOS that gives ud access to saving and retrieving stored data in the device or simulator
    UserDefaults.standard.set(unit.rawValue, forKey: UserPreferenceKey.unitMeasurement)
    
    //; key is unitMeasurement
    // value us either "Miles" or "Kilometers"
    // UserDefaults: ["Unit Measurement" : "Miles"]
  }
  
  // retrieve a user defaults value (object)
  func getUnitMeasurement() -> UnitMeasurement? {
    guard let unitMeasurement = UserDefaults.standard.object(forKey: UserPreferenceKey.unitMeasurement) as? String else {
      return nil
    }
    return UnitMeasurement(rawValue: unitMeasurement)
  }
  
  func updateActivity(with activity: Activity) {
    // storing the activity
    UserDefaults.standard.set(activity.rawValue, forKey: UserPreferenceKey.activity)
  }
  
  func getActivity() -> Activity? {
    guard let activity = UserDefaults.standard.object(forKey: UserPreferenceKey.activity) as? String else {
      return nil
    }
    return Activity(rawValue: activity)
  }
  
  func getBackgroundColor() -> Background? {
    guard let backgroundColor = UserDefaults.standard.object(forKey: UserPreferenceKey.backgroundColor) as? String else {
      return nil
    }
    return Background(rawValue: backgroundColor)
  }

  func updateBackgroundColor(with color: Background) {
    UserDefaults.standard.set(color.rawValue, forKey: UserPreferenceKey.backgroundColor)
  }
  
  
}

