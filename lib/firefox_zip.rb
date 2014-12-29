require 'firefox_zip/parses/manifest'
require 'firefox_zip/files/project'

module FirefoxZip
  class << self
    attr_reader :name, :description, :launch_path, :icons, :icon, :type, :permissions

    def analyze(file_path)
      project = Files::Project.new(file_path)
      @name = project.manifest_data.name
      @description = project.manifest_data.description
      @launch_path = project.manifest_data.launch_path
      @icons = project.icons
      @icon = project.icon
      @type = project.manifest_data.type
      @permissions = project.manifest_data.permissions

      self
    end
  end
end