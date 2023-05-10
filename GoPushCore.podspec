Pod::Spec.new do |s|
  s.name         = "GoPushCore"
  s.version      = "1.1.0"
  s.summary      = "APIs for internal goPUSH usage"
  s.platform     = :ios

  s.description  = "APIs for internal goPUSH usage. Not for public use."

  s.homepage     = "https://www.iwinback.com/"
  s.license      = { :type => 'Apache-2.0', :file => 'LICENSE' }

  s.authors       = "iwinBACK Inc."
  s.source       = { :git => "https://github.com/iwinBACK-Inc/gopush-ios-sdk.git", :tag => s.version }

  s.swift_version = '5.3'

  s.ios.deployment_target = '14.0'
  s.ios.vendored_frameworks  = 'bin/GoPushCore.xcframework'
end
