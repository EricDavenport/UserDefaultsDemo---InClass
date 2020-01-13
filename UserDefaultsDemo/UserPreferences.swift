//
//  UserPreferences.swift
//  UserDefaultsDemo
//
//  Created by Eric Davenport on 1/13/20.
//  Copyright © 2020 Eric Davenport. All rights reserved.
//

import Foundation

enum Activity: String {
  case run = "run"
  case bike = "bike"
}

enum UnitMeasurement: String {
  case miles = "Miles"
  case kilometers = "Kiolometers"
}

struct UserPreferenceKey {
  static let unitMeasurement = "Unit Measurement"
  static let activity = "Activity"
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
  
  
}

