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

  s.swift_version = '5.3'

  s.default_subspec = 'App'

  s.subspec 'Core' do |core|
    core.vendored_frameworks  = 'bin/GoPushCore.xcframework'
    core.ios.deployment_target = '14.0'
    core.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    core.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  end

  s.subspec 'App' do |app|
    app.vendored_frameworks  = 'bin/GoPushApp.xcframework'
    app.dependency 'GoPush/Core'
    app.ios.deployment_target = '14.0'
    app.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    app.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  end

  s.subspec 'Notifications' do |notifications|
    notifications.vendored_frameworks  = 'bin/GoPushNotifications.xcframework'
    notifications.dependency 'GoPush/Core'
    notifications.ios.deployment_target = '14.0'
    notifications.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    notifications.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  end

  s.subspec 'Messaging' do |messaging|
    messaging.vendored_frameworks  = 'bin/GoPushMessaging.xcframework'
    messaging.dependency 'GoPush/Core'
    messaging.ios.deployment_target = '14.0'
    messaging.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    messaging.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  end
end
