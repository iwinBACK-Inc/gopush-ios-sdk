## Firebase Setup

Set up Firebase Cloud Messaging by following [this guide](https://firebase.google.com/docs/ios/setup). Make sure you add  `FirebaseMessaging` in the step 4.4 of the guide.


## Add Notification Service Extension target

Navigate to **File -> New -> Targtet...** and choose **Notification Service Extension**. Give it a name and click **Finish**.


## Installation

### Install via SPM

Add https://github.com/iwinBACK-Inc/gopush-ios-sdk package to your project. Choose the GoPush products you want to use.

### Install via Cocoapods

Link you application target with `Firebase/Messaging`, `GoPush/App`, `GoPush/Notifications`:

```ruby
target 'YourApplicationTarget' do
  pod 'Firebase/Messaging'
  pod 'GoPush/App'
  pod 'GoPush/Notifications'
end
```

Link you notification service extension target with `Firebase/Messaging`, `GoPush/Notifications`:

```ruby
target 'YourNotificationServiceTarget' do
  pod 'Firebase/Messaging'
  pod 'GoPush/Notifications'
end
```

### Manual installation

Dowload [GoPushCore.xcframework](bin/GoPushCore.xcframework), [GoPushApp.xcframework](bin/GoPushApp.xcframework), [GoPushNotifications.xcframework](bin/GoPushNotifications.xcframework) and drag these frameworks to your XCode project. Link your application target with `GoPushCore`, `GoPushApp`, `GoPushNotifications`. Link your notification service extension target with `GoPushCore`, `GoPushNotifications`.


## Build Settings

Select your main application target and open **Build Settings** tab. Add `-ObjC` flag to **Other Linker Flags**.
GoPush uses Objective-C runtime to automatically swizzle AppDelegate methods. This flag is not needed if you use [manual integration](ManualInit.md).


## Enable Push Notifications capability

Select your application target and navigate to **Singning & Capabilities** tab. Add **Push Notifications** and **Background Modes -> Remote notifications** capabilities.


## Configure GoPush

GoPush should be configured in the application delegate's `application(_:didFinishLaunchingWithOptions:)` method:

```swift
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
  // Firebase should be configured before calling GoPush.go() method
  FirebaseApp.configure()

  let config = Config()
  config.apiToken = "Your goPUSH API Token"
  GoPush.go(config: config, launchOptions: launchOptions)
}
```


## Request Notification Permission

Add the following code when your application is ready to request push notifcation permission:

```swift
GoPush.requestNotificationPermission()
```


## Notification Service Extension

Forward `UNNotificationRequest` to the GoPush SDK by calling `RemoteNotificationCenter.handler().didReceiveNotificationRequest()` inside your Notification Service Extension's `UNNotificationServiceExtension.didReceive(_:withContentHandler:)` method:

```swift
override func didReceive(
    _ request: UNNotificationRequest,
    withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void
  ) {
  RemoteNotificationCenter.handler().didReceiveNotificationRequest(request)

  // 
}
```

## Delivery Metrics (optional)

Enable export delivery metrics to BigQuery during GoPush configuration:

```swift
config.exportDeliveryMetricsToBigQuery = true
```
