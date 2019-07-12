#
# Be sure to run `pod lib lint GooseNet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GooseNet'
  s.version          = '0.1.0'
  s.summary          = 'A tiny vanilla async networking convenience pod using GCD and dataTask'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"This CocoaPods library is meant as a minimalistic async networking layer for reuse across projects to cut down on code repetition. Upcoming features include SSL-Pinning helpers for security concerns, request retrying, and webSocketTask and streamTask support"
                       DESC

  s.homepage         = 'https://github.com/aviatoali/GooseNet'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aviatoali' => 'aviatoali@gmail.com' }
  s.source           = { :git => 'https://github.com/aviatoali/GooseNet.git', :tag => s.version.to_s }
  s.social_media_url   = 'https://www.linkedin.com/in/ali-shah-717144123/'

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'GooseNet/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GooseNet' => ['GooseNet/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
