require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNCClipboard"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']
  #s.platform     = {:ios => "9.0", :osx => "10.14"}
  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.14"

  s.source = {:git => '../../'}
  #s.source       = { :http => 'file:///' + __dir__ + '/' }  
  #{ :git => "https://github.com/react-native-community/clipboard", :tag => "v#{s.version}" }
  s.ios.source_files = "ios/**/*.{h,m,mm}"
  s.osx.source_files = "macos/*.{h,m,mm}"

  s.dependency 'React'
end
