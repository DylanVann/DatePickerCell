Pod::Spec.new do |spec|
  spec.name         = 'DVDatePickerTableViewCell'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/DylanVann/DVDatePickerTableViewCell'
  spec.authors      = { 'Dylan Vann' => 'dylanvann@gmail.com' }
  spec.summary      = 'Inline/Expanding date picker for table views.'
  spec.screenshot  = "http://i.imgur.com/dpHIzw8.gif"
  spec.source       = { :git => 'https://github.com/DylanVann/DVDatePickerTableViewCell.git', :tag => 'v#{s.version}' }
  spec.source_files = 'DVDatePickerTableViewCell/**/*.{swift}'
end