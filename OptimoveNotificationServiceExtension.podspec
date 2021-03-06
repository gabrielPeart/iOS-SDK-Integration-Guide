Pod::Spec.new do |s|
  s.name             = 'OptimoveNotificationServiceExtension'
  s.version          = '2.0.1'
  s.summary          = 'A notification extension framework for Optimove SDK'

  s.description      = <<-DESC
This framework is an addition for the main OptimoveSDK in order to handle notifications
                       DESC

  s.homepage         = 'https://github.com/optimove-tech/iOS-SDK-Integration-Guide'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'optimove.develop.mobile@gmail.com' => 'optimove.develop.mobile@gmail.com' }
  s.source           = { :git => 'https://github.com/optimove-tech/iOS-SDK-Integration-Guide.git', :tag => s.version.to_s }
  

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.source_files = 'OptimoveNotificationServiceExtension/OptimoveNotificationServiceExtension/Classes/**/*'
  s.frameworks = 'UserNotifications', 'UIKit'
end
