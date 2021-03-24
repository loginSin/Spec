#
#  Be sure to run `pod spec lint BailingVideo.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "QIRongCloudRTC"
  s.version      = "5.1.0"
  s.summary      = "RongCloud RTC"
  s.homepage     = "http://www.rongcloud.cn"

  s.license      = { :type => "Copyright", :text => "Copyright 2018 RongCloud" }

  s.author        = { "tanghaibing" => "tanghaibing@bailingcloud.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :http => "https://downloads.rongcloud.cn/RongCloudRTC_iOS_SDK_v5_1_0_Dev.zip"}
  s.requires_arc = true

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  #s.resources = "*/RongCloud.bundle", "*/en.lproj", "*/zh-Hans.lproj", "*/*.plist"

  s.subspec 'QIRongCallLib' do |calllib|
    calllib.vendored_frameworks = 'RongCloudRTC/**/RongCallLib.framework', 'RongCloudRTC/**/RongRTCLib.framework'
    #calllib.vendored_libraries = "RongCloudRTC/**/*.a"
    calllib.xcconfig = { "OTHER_LDFLAGS" => "-ObjC", "OTHER_LDFLAGS[arch=i386]" => "-Wl,-read_only_relocs,suppress" }
    calllib.libraries = "z", "bz2", "iconv", "stdc++", "xml2", "sqlite3", "c++", "c++abi", "resolv"
    calllib.frameworks = "SystemConfiguration", "VideoToolbox", "GLKit", "CoreMedia", "CoreGraphics", "AVFoundation", "CoreVideo", "CoreTelephony", "CoreAudio", "CFNetwork", "AudioToolbox", "UIKit", "CoreMotion"
    calllib.dependency "RongCloudIM/ChatRoom", "5.1.0"
  end

 s.subspec 'QIRongCallKit' do |callkit|
    callkit.resources = 'RongCloudRTC/**/RongCallKit.bundle', 'RongCloudRTC/**/en.lproj', 'RongCloudRTC/**/zh-Hans.lproj', 'RongCloudRTC/**/ar.lproj'
    callkit.vendored_frameworks = 'RongCloudRTC/**/RongCallKit.framework'
    callkit.xcconfig = { "OTHER_LDFLAGS[arch=i386]" => "-Wl,-read_only_relocs,suppress" }
    callkit.libraries = "z", "stdc++", "xml2", "sqlite3", "c++", "c++abi"
    callkit.frameworks = "AssetsLibrary", "MapKit", "ImageIO", "CoreLocation", "SystemConfiguration", "QuartzCore", "OpenGLES", "CoreVideo",  "CoreTelephony", "CoreMedia", "CoreAudio", "AudioToolbox", "AVFoundation", "UIKit", "CoreGraphics"
    callkit.dependency "QIRongCloudRTC/QIRongCallLib"
    callkit.dependency "RongCloudIM/IMLib", "5.1.0"
    callkit.dependency "RongCloudIM/IMKit", "5.1.0"
  end

end
