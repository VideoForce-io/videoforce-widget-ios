#
# Be sure to run `pod lib lint VFWidget.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VFWidget'
  s.version          = '1.0'
  s.summary          = 'Video call widget from VideoForce'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/VideoForce-io/videoforce-widget-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'VideoForce' => 'info@videoforce.ru' }
  s.source           = { :git => 'https://github.com/VideoForce-io/videoforce-widget-ios.git', :tag => s.version.to_s }
  # s.social_media_url = ''

  s.ios.deployment_target = '11.0'
  s.swift_version = ['5.0', '5.1', '5.2']

  s.source_files = 'VFWidget/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VFWidget' => ['VFWidget/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'WKWebViewRTC', '~> 0.4.0'
end
