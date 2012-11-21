Pod::Spec.new do |s|
  s.name         = "RateStars"
  s.version      = "0.0.1"
  s.summary      = "An App Store review liked, a rating view easily to use anywhere in the iOS App."
  s.homepage     = "https://github.com/edwardinubuntu/RateStars"
  s.license      = 'MIT'
  s.author       = { "Edward Chiang" => "edwardinubuntu@gmail.com" }
  s.source       = { :git => "https://github.com/edwardinubuntu/RateStars.git", :tag => "v0.0.2" }
  s.platform     = :ios, '5.0'
  s.source_files = 'RateStars', 'RateStars/**/*.{h,m}'
  s.resources = "RateStars/images/*.png"
  s.framework  = 'CoreGraphics'
end
