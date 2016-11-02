#
#

Pod::Spec.new do |s|
  s.name             = 'jkool-client-objc-api'
  s.version          = '0.1.7'
  s.summary          = 'jKool Streaming, Querying and Subscriptions.'
#
#

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
