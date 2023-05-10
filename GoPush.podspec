Pod::Spec.new do |s|
  s.name         = "GoPush"
  s.version      = "1.1.0"
  s.summary      = "GoPush"
  s.platform     = :ios

  s.description  = "goPUSH notification and In-App messaging library"

  s.homepage     = "https://www.iwinback.com/"
  s.license      = { :type => 'Apache-2.0', :file => 'LICENSE' }

  s.authors       = "iwinBACK Inc."
  s.source       = { :git => "https://github.com/iwinBACK-Inc/gopush-ios-sdk.git", :tag => s.version }

  s.ios.deployment_target = '14.0'

  s.swift_version = '5.3'

  s.default_subspec = 'App'

  s.subspec 'Core' do |core|
    core.ios.deployment_target = '14.0'
    core.dependency 'GoPushCore', '~> 1.1.0'
  end

  s.subspec 'App' do |app|
    app.ios.deployment_target = '14.0'
    app.dependency 'GoPushApp', '~> 1.1.0'
  end

  s.subspec 'Notifications' do |notifications|
    notifications.ios.deployment_target = '14.0'
    notifications.dependency 'GoPushNotifications', '~> 1.1.0'
  end

  s.subspec 'Messaging' do |messaging|
    messaging.ios.deployment_target = '14.0'
    messaging.dependency 'GoPushMessaging', '~> 1.1.0'
  end
end
