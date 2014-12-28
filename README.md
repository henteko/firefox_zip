# Firefox Zip

This gem library is Firefox os application package file (.zip) analyzer. you can read any information of zip files.

## Install

```sh
$ gem install firefox_zip

# or

gem 'firefox_zip'
$ bundle install
```

## How to use

```rb
require 'firefox_zip'

app = FirefoxZip.analyze('/path/to/firefox_app.zip')

app.name        # [String] app name
app.description # [String] app description
app.launch_path # [String] app launch path
app.icon        # [File] app default icon
app.icons       # [Array] app icons
app.type        # [String] app type
app.permissions # [Array] app permissons
```

## License
MIT