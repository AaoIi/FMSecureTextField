#
#  Be sure to run `pod spec lint FMSecureTextField.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "FMSecureTextField"
  spec.version      = "1.0.0"
  spec.summary      = "Show or hide password for UITextfield secure text entry - Swift"

  spec.description  = "FMSecureTextField provides a friendly way to show or hide password for secure textfield, in either image or text."
  spec.homepage     = "https://github.com/AaoIi/FMSecureTextField"
  spec.screenshots  = 'https://raw.githubusercontent.com/AaoIi/FMSecureTextField/master/demo.gif'

  spec.license      = "MIT"

  spec.author             = "Saad Albasha"
  # Or just: spec.author    = "Saad Albasha"

  # spec.platform     = :ios
  spec.platform     = :ios, "8.0"
  spec.swift_version = '5.0'

  spec.source       = { :git => "https://github.com/AaoIi/FMSecureTextField.git", :tag => "1.0.0" }
  spec.source_files  = 'FMSecureTextField/**/*.swift','FMSecureTextField/**/*.h'


end
