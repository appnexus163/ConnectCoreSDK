Pod::Spec.new do |s|
  s.name             = 'ConnectSDK-Core'
  s.version          = '1.0.0'
  s.summary          = 'Core classes for Connect SDK (iOS) providing device discovery and control for TVs and streaming devices.'
  s.description      = <<-DESC
The Connect SDK Core contains all of the core classes required for basic operation of Connect SDK.
It includes support for several protocols such as Apple TV, DIAL, DLNA, LG Netcast, LG webOS, LG Cast, and Roku.
Typically this repo is used as a submodule of the main Connect-SDK-iOS project, but it can also be integrated via CocoaPods.
  DESC

  s.homepage         = 'https://github.com/ConnectSDK/Connect-SDK-iOS-Core'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'LG Electronics' => 'connectsdk@lge.com' }

  s.source           = { :git => 'https://github.com/ConnectSDK/Connect-SDK-iOS-Core.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.requires_arc     = true

  s.prefix_header_file = 'ConnectSDK-Prefix.pch'

  s.source_files     = [
    'ConnectSDK.h',
    'Devices/**/*.{h,m}',
    'Discovery/**/*.{h,m}',
    'Helpers/**/*.{h,m}',
    'Services/**/*.{h,m}',
    'Frameworks/asi-http-request/Classes/**/*.{h,m}',
    'Frameworks/asi-http-request/External/Reachability/**/*.{h,m}',
    'Frameworks/GCDWebServer/**/*.{h,m}',
    'Frameworks/objc-guid/**/*.{h,m}',
    'Frameworks/SocketRocket/*.{h,m}',
    'Frameworks/XMLReader/*.{h,m}',
    'Frameworks/xswi/*.{h,m}'
  ]

  s.public_header_files = [
    'ConnectSDK.h',
    'Devices/**/*.h',
    'Discovery/**/*.h',
    'Helpers/**/*.h',
    'Services/**/*.h'
  ]

  s.frameworks = [
    'Foundation',
    'SystemConfiguration',
    'AVFoundation',
    'MediaPlayer',
    'CoreGraphics',
    'CFNetwork'
  ]
end


