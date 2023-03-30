## Installation

Install In-App Messaging SDK via SPM or CocoaPods:

```ruby
pod 'GoPush/Messaging'
```

## Start messaging

```swift
InAppMessaging.messaging().go()
```

This will automatically trigger default `applicationOpen` event.

## Pause messaging

Pause InAppMessaging when user should not be interrupted with popups (don’t forget to unpause when application is ready to receive In-Apps again):

```swift
InAppMessaging.messaging().isPaused = true
```

## Listening for messages


Register In-App Messaging delegate:

```swift
InAppMessaging.messaging().delegate = self
```

Implement delegate methods:

```swift
func messaging(_ messaging: InAppMessaging, willPresent message: InAppMessage) {
	// Message displayed
}

func messaging(_ messaging: InAppMessaging, didFinishPresenting message: InAppMessage) {
	// Message finished
}

func messaging(_ messaging: InAppMessaging, didReceive event: InAppMessageEvent, from message: InAppMessage) {
	// Handle In-App event
}
```
