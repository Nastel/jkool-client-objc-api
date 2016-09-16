#
# Be sure to run `pod lib lint jKooliOSStreaming.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'jKooliOSStreaming'
  s.version          = '0.0.2'
  s.summary          = 'jKool Streaming, Querying and Subscriptions.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
jKool is a big-data solution that allows you to easily store (via our streaming Api’s) your data in our hosted Cassandra repository and then analyze it visually via our User Interface.  jKool can analyze fast data such as logs, metrics, transactions in real-time, etc. As a result, you can focus on finding insight and opportunities in your data. This iOS Api will allow you to stream, query and subscribe to jKool data from within your iOS apps. For more information on jKool, please visit www.jkoolcloud.com
DESC

  s.homepage         = 'https://github.com/Nastel/jKooliOSStreaming'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'cbdbeb9' => 'support@jkoolcloud.com' }
  s.source           = { :git => 'https://github.com/Nastel/jKooliOSStreaming.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'jKooliOSStreaming/Classes/**/*'
  
  # s.resource_bundles = {
  #   'jKooliOSStreaming' => ['jKooliOSStreaming/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit’, ‘SocketRocket’
  s.dependency 'SocketRocket'
  # s.dependency ‘AFNetworking', '~> 2.3'
end
