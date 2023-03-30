## Session Tracking

Add the following code as soon as a user logs in:

```swift
let user = User(id: "user_id")
user.email = "user email address"
user.phoneNumber = "user phone number"
GoPush.startUserSession(user: user)
```

Use the following method to track anonymous sessions if no user is logged in yet or if the user logs out:

```swift
GoPush.startAnonymousSession()
```

## Custom Tags

Users can be tagged with custom properties to be able to target specific audience segments:

```swift
GoPush.setTag(24, forKey:"age")
GoPush.setTag("cat", forKey: "favouritePet")
```
