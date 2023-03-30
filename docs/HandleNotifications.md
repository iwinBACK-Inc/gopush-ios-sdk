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
