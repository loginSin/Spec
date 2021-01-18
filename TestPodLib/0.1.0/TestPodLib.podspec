Pod::Spec.new do |s|
  s.name             = 'TestPodLib'
  s.version          = '0.1.0'
  s.summary          = 'A short description of TestPodLib.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/loginSin/TestPodLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'loginSin' => 'qixinbing@rongcloud.cn' }
  s.source           = { :git => 'https://github.com/loginSin/TestPodLib.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'TestPodLib/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
