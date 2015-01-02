require 'firefox_zip/parses/manifest'
require 'firefox_zip/files/project'

module FirefoxZip
  class << self
    attr_reader :name, :description, :launch_path,
                :icons, :icon, :type, :permissions,
                :developer, :locales, :default_locale

    def analyze(file_path)
      project = Files::Project.new(file_path)
      @name = project.manifest_data.name
      @description = project.manifest_data.description
      @launch_path = project.manifest_data.launch_path
      @icons = project.icons
      @icon = project.icon
      @type = project.manifest_data.type
      @permissions = project.manifest_data.permissions
      @developer = project.manifest_data.developer
      @locales = project.manifest_data.locales
      @default_locale = project.manifest_data.default_locale

      self
    end
  end
end