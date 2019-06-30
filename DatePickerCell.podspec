Pod::Spec.new do |s|
    s.name         = 'DatePickerCell'
    s.version      = '1.0.8'
    s.license      = { :type => 'MIT' }
    s.homepage     = 'https://github.com/DylanVann/DatePickerCell'
    s.authors      = { 'Dylan Vann' => 'dylan@dylanvann.com' }
    s.summary      = 'Inline/Expanding date picker for table views.'
    s.screenshot  = "http://i.imgur.com/dpHIzw8.gif"
    s.ios.deployment_target = '8.0'
    s.swift_version = '5.0'
    s.source       = { :git => 'https://github.com/DylanVann/DatePickerCell.git', :tag => "v#{s.version}" }
    s.source_files = 'Source/*.swift'
end
