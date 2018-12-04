Pod::Spec.new do |s|
  s.name             = 'JeraSystem'
  s.version          = '0.1'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.summary          = 'Design System develop by Jera'
  s.homepage         = 'https://github.com/vitormesquita/JeraSystem'  
  s.author           = { 'Vitor mesquita' => 'vitor.mesquita09@gmail.com' }
  
  s.source           = { :git => 'https://github.com/vitormesquita/JeraSystem.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/classes/**/*'

end