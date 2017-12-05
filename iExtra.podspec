# Run `pod lib lint iExtra.podspec' to ensure this is a valid spec.

Pod::Spec.new do |s|
  s.name             = 'iExtra'
  s.version          = '1.0.0'
  s.summary          = 'iExtra contains a bunch of extra stuff for the iOS framework.'

  s.description      = <<-DESC
iExtra is a Swift library that contains a bunch of extra stuff for the iOS framework.
There is no main focus; all general features I build for my various apps end up here
in order to make the code in my apps app-specific.
                       DESC

  s.homepage         = 'https://github.com/danielsaidi/iExtra'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Saidi' => 'daniel.saidi@gmail.com' }
  s.source           = { :git => 'https://github.com/danielsaidi/iExtra.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/danielsaidi'

  s.ios.deployment_target = '8.0'

  s.source_files = 'iExtra/**/*.swift'

end
