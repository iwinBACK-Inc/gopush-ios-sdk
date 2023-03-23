# Integration

1. Set up Firebase Cloud Messaging by following [this guide](https://firebase.google.com/docs/ios/setup). Make sure you add  `FirebaseMessaging` in step 4.4 of the guide.

2. Link your application binary with [GoPushCore.xcframework](bin/GoPushCore.xcframework), [GoPushApp.xcframework](bin/GoPushApp.xcframework), [GoPushNotifications.xcframework](bin/GoPushNotifications.xcframework).

3. Add Notification Service Extension target and link it with `FirebaseMessaging`, [GoPushCore.xcframework](bin/GoPushCore.xcframework), [GoPushNotifications.xcframework](bin/GoPushNotifications.xcframework).

4. Enable Push Notifications capability

Select your application target and navigate to **Singning & Capabilities** tab. Add **Push Notifications** and **Background Modes -> Remote notifications** capabilities.

5. Initialize SDK

```swift
FirebaseApp.configure()

let config = Config()
config.apiToken = "Your goPUSH API Token"
GoPush.go(config: config, launchOptions: launchOptions)

GoPush.requestNotificationPermission()
```

6. Add following code to your Notification Service Extension `UNNotificationServiceExtension.didReceive(_:withContentHandler:)` method:

```swift
RemoteNotificationCenter.handler().didReceiveNotificationRequest(request)
```

7. Add `-ObjC` flag in **Build Settings -> Other Linker Flags**. GoPush uses Objective C runtime to automatically swizzle AppDelegate methods. This flag is not needed if you use manual integration.


# Manual integration

GoPush SDK automatically swizzles `UIApplicationDelegate`, `UNUserNotificationCenterDelegate` and `MessagingDelegate` methods to simplify SDK integration. This behavior can be disabled:

```swift
config.autoRegister = false
config.autoHandleNotifications = false
```

If you choose to disable automatic integration, you will need to forward the following delegates callbacks to GoPush SDK:

```swift
func application(
_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
) {
	GoPush.appDelegate().application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
}

func application(
_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error
) {
	GoPush.appDelegate().application(application, didFailToRegisterForRemoteNotificationsWithError: error)
}

func application(
_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
	fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void
) {
	RemoteNotificationCenter.handler().didReceiveRemoteNotification(userInfo)
	completionHandler(.noData)
}

func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
	GoPush.messagingDelegate().didReceiveRegistrationToken(fcmToken)
}

func userNotificationCenter(
_ center: UNUserNotificationCenter, willPresent notification: UNNotification,
withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
) {
	RemoteNotificationCenter.handler().willPresentNotification(notification)
	completionHandler([.list, .banner, .sound])
}

func userNotificationCenter(
_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse,
withCompletionHandler completionHandler: @escaping () -> Void
) {
	RemoteNotificationCenter.handler().didReceiveNotificationResponse(response)
	completionHandler()
}
```


# User session tracking

Add following code as soon as a user logs in:

```swift
let user = User(id: "user_id")
user.email = "user email address"
user.phoneNumber = "user phone number"
GoPush.startUserSession(user: user)
```

Use following method to track anonymous sessions if no user is logged in yet or if the user logs out:

```swift
GoPush.startAnonymousSession()
```


# Push notification tracking

Enable export delivery metrics to BigQuery:

```swift
config.exportDeliveryMetricsToBigQuery = true
```

Make sure you have added Notification Service Extension as mentioned in the integration guide.


# Notification events

Implement `RemoteNotificationCenterDelegate` methods to handle GoPush notifications:

```swift
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
  RemoteNotificationCenter.shared().delegate = self
}

func remoteNotificationCenter(
    _ center: RemoteNotificationCenter, didReceive notification: RemoteNotification
  ) {
	// TODO: handle silent notifications (notifications sent with 'content-available' flag)
}

func remoteNotificationCenter(
_ center: RemoteNotificationCenter, willPresent notification: RemoteNotification
) {
	// TODO: handle notification receive callback
}

func remoteNotificationCenter(
_ center: RemoteNotificationCenter, didOpen notification: RemoteNotification
) {
	// TODO: handle notification open callback
}

func remoteNotificationCenter(
_ center: RemoteNotificationCenter, didDismiss notification: RemoteNotification
) {
	// TODO: handle notification dismiss callback
}

func remoteNotificationCenter(
_ center: RemoteNotificationCenter, didOpen notification: RemoteNotification, action: String,
category: String
) {
	// TOOD: handle notification action callback
}
```
