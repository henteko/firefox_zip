require 'firefox_zip'

app = FirefoxZip.analyze(File.expand_path('../package.zip', __FILE__))

p app.name        # [String] app name
p app.description # [String] app description
p app.launch_path # [String] app launch path
p app.icon        # [File] app default icon
p app.icons       # [Array] app icons
p app.type        # [String] app type
p app.permissions # [Array] app permissons
p app.developer   # [Hash] app developer info
p app.default_locale # [String] app default locale
p app.locales        # [Hash] app locales
p app.version        # [String] app version
p app.size           # [Fixnum] app zip file size

p app.to_hash        # [Hash] app info to hash
