Pod::Spec.new do |s|
  s.name         = "GoPush"
  s.version      = "1.0.0"
  s.summary      = "GoPush"
  s.platform     = :ios

  s.description  = "goPUSH notification and In-App messaging library"

  s.homepage     = "https://www.iwinback.com/"
  s.license      = { :type => 'Apache-2.0', :file => 'LICENSE' }

  s.authors       = "iwinBACK Inc."
  s.source       = { :git => "https://github.com/iwinBACK-Inc/gopush-ios-sdk.git", :tag => s.version }

  s.ios.deployment_target = '14.0'

  s.default_subspec = 'App'

  s.subspec 'Core' do |core|
    core.ios.vendored_frameworks  = 'bin/GoPushCore.xcframework'
    core.ios.deployment_target = '14.0'
  end

  s.subspec 'App' do |app|
    app.ios.vendored_frameworks  = 'bin/GoPushApp.xcframework'
    app.dependency 'GoPush/Core', '~> 1.0.0'
    app.ios.deployment_target = '14.0'
  end

  s.subspec 'Notifications' do |notifications|
    notifications.ios.vendored_frameworks  = 'bin/GoPushNotifications.xcframework'
    notifications.dependency 'GoPush/Core', '~> 1.0.0'
    notifications.ios.deployment_target = '14.0'
  end

  s.subspec 'Messaging' do |messaging|
    messaging.ios.vendored_frameworks  = 'bin/GoPushMessaging.xcframework'
    messaging.dependency 'GoPush/Core', '~> 1.0.0'
    messaging.ios.deployment_target = '14.0'
  end
end
