Pod::Spec.new do |s|
  s.name         = 'ConnectSDK-Core'
  s.version      = '1.1.0'
  s.summary      = 'Connect SDK Core: core discovery and device control for TVs and streaming devices.'

  s.description  = <<-DESC
                    The Connect SDK Core contains all of the core classes required for basic operation of Connect SDK.
                    It includes support for several protocols such as Apple TV, DIAL, DLNA, LG Netcast, LG webOS, LG Cast, and Roku.
                    This repository is a standalone version of the original Connect-SDK-iOS core module, packaged for CocoaPods.
                   DESC

  s.homepage     = 'https://github.com/appnexus163/ConnectCoreSDK'
  s.license      = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author       = { 'LG Electronics' => 'connectsdk@lge.com' }

  s.source       = { :git => 'https://github.com/appnexus163/ConnectCoreSDK.git',
                     :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.libraries    = 'z', 'icucore'
  s.requires_arc = true

  s.prefix_header_file = 'ConnectSDK-Prefix.pch'

  s.xcconfig = {
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }

  non_arc_files = [
    'Frameworks/asi-http-request/External/Reachability/*.{h,m}',
    'Frameworks/asi-http-request/Classes/*.{h,m}'
  ]

  s.default_subspecs = 'Core'

  s.subspec 'Core' do |sp|
    sp.source_files  = [
      'ConnectSDK.h',
      'Devices/**/*.{h,m}',
      'Discovery/**/*.{h,m}',
      'Helpers/**/*.{h,m}',
      'Services/**/*.{h,m}',
      'Frameworks/**/*.{h,m}'
    ]

    sp.exclude_files = non_arc_files +
                       [
                         'ConnectSDKTests/**/*',
                         'ConnectSDKAcceptanceTests/**/*',
                         'ConnectSDKIntegrationTests/**/*',
                         'Frameworks/LGCast/**/*.h'
                       ]

    sp.public_header_files = [
      'ConnectSDK.h',
      'Devices/**/*.h',
      'Discovery/**/*.h',
      'Helpers/**/*.h',
      'Services/**/*.h',
      'Frameworks/GCDWebServer/**/*.h',
      'Frameworks/SocketRocket/LGSRWebSocket.h'
    ]

    sp.private_header_files = [
      'Discovery/**/*_Private.h',
      'Services/**/*_Private.h',
      'Services/Helpers/**/*_Private.h'
    ]

    sp.frameworks = [
      'Foundation',
      'SystemConfiguration',
      'AVFoundation',
      'MediaPlayer',
      'CoreGraphics',
      'CFNetwork'
    ]

    sp.vendored_frameworks = [
      'Frameworks/LGCast/LGCast.xcframework',
      'Frameworks/LGCast/GStreamerForLGCast.xcframework'
    ]
    sp.preserve_paths = [
      'Frameworks/LGCast/LGCast.xcframework',
      'Frameworks/LGCast/GStreamerForLGCast.xcframework'
    ]

    sp.requires_arc = true
    sp.dependency 'ConnectSDK-Core/no-arc'
  end

  s.subspec 'no-arc' do |sp|
    sp.source_files = non_arc_files
    sp.requires_arc = false
    sp.compiler_flags = '-w'
  end
end

