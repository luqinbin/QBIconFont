#
# Be sure to run `pod lib lint QBIconFont.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QBIconFont'
  s.version          = '0.0.2'
  s.summary          = 'QBIconFont_OC'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	QBIconFont_OC 版本
                       DESC

  s.homepage         = 'https://github.com/luqinbin/QBIconFont'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luqinbin' => '751536545@qq.com' }
  s.source           = { :git => 'https://github.com/luqinbin/QBIconFont.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QBIconFont/IconFont/**/*'
  
  # s.resource_bundles = {
  #   'QBIconFont' => ['QBIconFont/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/IconFont/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
