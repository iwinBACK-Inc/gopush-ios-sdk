GoPush SDK automatically swizzles `UIApplicationDelegate`, `UNUserNotificationCenterDelegate` and `MessagingDelegate` methods to simplify the SDK integration. This behavior can be disabled during GoPush configuration:

```swift
config.autoRegister = false
config.autoHandleNotifications = false
```

If you choose to disable automatic integration, you will need to forward the following delegate methods to GoPush SDK:

### UIApplicationDelegate

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
```

### UNUserNotificationCenterDelegate

```swift
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

### MessagingDelegate

```swift
func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
	GoPush.messagingDelegate().didReceiveRegistrationToken(fcmToken)
}
```
