//
//  NotificationSampleApp.swift
//  NotificationSample
//
//  Created by Dmitry Malyugin on 23.03.2023.
//

import SwiftUI

import FirebaseCore
import GoPushApp
import GoPushNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    
    let config = Config()
    config.apiToken = "YOUR_GOPUSH_API_TOKEN"
    config.exportDeliveryMetricsToBigQuery = true
    GoPush.go(config: config, launchOptions: launchOptions)
    
    return true
  }
}

@main
struct NotificationSampleApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
