require 'json'

module FirefoxZip
  module Parses
    class Manifest
      attr_reader :name, :description, :launch_path,
                  :icons, :icon, :type, :permissions,
                  :developer, :locales, :default_locale,
                  :version

      # 推奨するサイズ順に並んでる
      SUPPORT_DEFAULT_ICON_SIZE = [512, 128, 60, 48, 16]

      def initialize(manifest_data)
        data = JSON.parse(manifest_data)

        @name = data['name']
        @description = data['description']
        @launch_path = data['launch_path']
        @icons = data['icons']
        @icon = get_default_icon(data['icons'])
        @type = data['type']
        @permissions = data['permissions']
        @developer = data['developer']
        @locales = data['locales']
        @default_locale = data['default_locale']
        @version = data['version'].to_f
      end

      private

      def get_default_icon(icons)
        return nil if icons == nil

        SUPPORT_DEFAULT_ICON_SIZE.each do |size|
          return icons[size.to_s] if icons[size.to_s] != nil
        end

        nil
      end
    end
  end
end