Pod::Spec.new do |s|
  s.name         = 'DVDatePickerTableViewCell'
  s.version      = '1.0.0'
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/DylanVann/DVDatePickerTableViewCell'
  s.authors      = { 'Dylan Vann' => 'dylanvann@gmail.com' }
  s.summary      = 'Inline/Expanding date picker for table views.'
  s.screenshot  = "http://i.imgur.com/dpHIzw8.gif"
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/DylanVann/DVDatePickerTableViewCell.git', :tag => "v#{s.version}" }
  s.source_files = 'DVDatePickerTableViewCell/**/*.{swift}'
end