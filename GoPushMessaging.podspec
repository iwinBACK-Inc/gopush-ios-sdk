Pod::Spec.new do |s|
  s.name         = "GoPushMessaging"
  s.version      = "1.0.0"
  s.summary      = "GoPush In-App Messaging"
  s.platform     = :ios

  s.description  = "GoPushMessaging is library that allows you to recieve In-App messages"

  s.homepage     = "https://www.iwinback.com/"
  s.license      = { :type => 'Apache-2.0', :file => 'LICENSE' }

  s.authors       = "iwinBACK Inc."
  s.source       = { :git => "https://github.com/iwinBACK-Inc/gopush-ios-sdk.git", :tag => s.version }

  s.swift_version = '5.3'

  s.ios.deployment_target = '14.0'
  s.ios.vendored_frameworks  = 'bin/GoPushMessaging.xcframework'

  s.dependency 'GoPushCore', '~> 1.0.0'
end
