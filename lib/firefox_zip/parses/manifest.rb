require 'json'

module FirefoxZip
  module Parses
    class Manifest
      attr_reader :name, :description, :launch_path,
                  :icons, :icon, :type, :permissions,
                  :developer, :locales, :default_locale,
                  :version

      def initialize(manifest_data)
        data = JSON.parse(manifest_data)

        @name = data['name']
        @description = data['description']
        @launch_path = data['launch_path']
        @icons = data['icons']
        @icon = data['icons']['16']
        @type = data['type']
        @permissions = data['permissions']
        @developer = data['developer']
        @locales = data['locales']
        @default_locale = data['default_locale']
        @version = data['version'].to_f
      end
    end
  end
end