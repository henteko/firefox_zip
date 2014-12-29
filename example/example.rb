require 'firefox_zip'

app = FirefoxZip.analyze(File.expand_path('../hello.zip', __FILE__))

p app.name        # [String] app name
p app.description # [String] app description
p app.launch_path # [String] app launch path
p app.icon        # [File] app default icon
p app.icons       # [Array] app icons
p app.type        # [String] app type
p app.permissions # [Array] app permissons

