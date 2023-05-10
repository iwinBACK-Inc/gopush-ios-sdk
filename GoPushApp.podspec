Pod::Spec.new do |s|
  s.name         = "GoPushApp"
  s.version      = "1.1.0"
  s.summary      = "GoPush Main"
  s.platform     = :ios

  s.description  = "GoPushApp includes GoPush class which provides main configuration for GoPush application"

  s.homepage     = "https://www.iwinback.com/"
  s.license      = { :type => 'Apache-2.0', :file => 'LICENSE' }

  s.authors       = "iwinBACK Inc."
  s.source       = { :git => "https://github.com/iwinBACK-Inc/gopush-ios-sdk.git", :tag => s.version }

  s.swift_version = '5.3'

  s.ios.deployment_target = '14.0'
  s.ios.vendored_frameworks  = 'bin/GoPushApp.xcframework'

  s.dependency 'GoPushCore', '~> 1.1.0'
end
