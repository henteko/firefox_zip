# Firefox Zip
[![Build Status](https://travis-ci.org/henteko/firefox_zip.svg?branch=master)](https://travis-ci.org/henteko/firefox_zip)

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

app.name           # [String] app name
app.description    # [String] app description
app.launch_path    # [String] app launch path
app.icon           # [File] app default icon
app.icons          # [Array] app icons
app.developer      # [Hash] app developer info
app.default_locale # [String] app default locale
app.locales        # [Hash] app locales
app.type           # [String] app type
app.permissions    # [Array] app permissons
app.version        # [String] app version
app.size           # [Float] app zip file size
```

## License
MIT
