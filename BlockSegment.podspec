
Pod::Spec.new do |s|
s.name             = 'BlockSegment'
s.version          = '0.1.0'
s.summary          = 'A block styled segment control'

s.description      = <<-DESC
Dynamic customizable block segment control
DESC

s.homepage         = 'https://github.com/jorelkimcruz/BlockSegment'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Jorel Cruz' => 'jorelkim.cruz@gmail.com' }
s.source           = { :git => 'https://github.com/jorelkimcruz/BlockSegment.git', :tag => s.version.to_s }

s.ios.deployment_target = '10.0'
s.source_files = 'BlockSegment/*'

end
