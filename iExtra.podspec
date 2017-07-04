#
# Be sure to run `pod lib lint iExtra.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iExtra'
  s.version          = '0.8.1'
  s.summary          = 'iExtra contains a bunch of extra stuff for the iOS framework.'

  s.description      = <<-DESC
iExtra is a Swift library that contains a bunch of extra stuff for the iOS framework.
There is no main focus; all general features I build for my various apps end up here
in order to make the code in my apps app-specific.
                       DESC

  s.homepage         = 'https://github.com/danielsaidi/iExtra'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Saidi' => 'daniel.saidi@gmail.com' }
  s.source           = { :git => 'https://github.com/danielsaidi/iExtra.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'iExtra/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iExtra' => ['iExtra/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
