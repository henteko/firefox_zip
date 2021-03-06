require 'tmpdir'
require 'zip'

module FirefoxZip
  module Files
    class Project
      attr_reader :manifest_data, :icon, :icons, :size
      MANIFEST_FILE_NAME = 'manifest.webapp'

      def initialize(zip_file_path)
        return raise 'not zip file' unless File.exists? zip_file_path

        @zip_file_path = zip_file_path
        @size = File.size(@zip_file_path)

        Dir.mktmpdir do |dir|
          make_zip_files(@zip_file_path, dir)
          
          manifest_file = get_manifest_file(dir)
          @manifest_data = FirefoxZip::Parses::Manifest.new(manifest_file.read)
          manifest_file.close
          @icons = get_icons_file(@manifest_data, dir)
          @icon = get_icon_file(@manifest_data, dir)
        end
      end

      private
      
      def make_zip_files(file_path, dir)
        Zip::File.open(file_path) do |zip_file|
          zip_file.each do |entry|
            path = "#{dir}/#{entry.name}"

            # dir 作成
            if dir?(path) && !File.exists?(path)
              FileUtils.mkdir_p(path)
              next
            end

            file = File.open(path, 'w')
            file.write(entry.get_input_stream.read)
            file.close
          end
        end
      end

      def dir?(entry_name)
        entry_name.match(/.+\/$/) != nil
      end
      
      def get_manifest_file(dir)
        File.open("#{dir}/#{MANIFEST_FILE_NAME}", 'r')
      end
      
      def get_icon_file(manifest_data, dir)
        get_file(dir, manifest_data.icon)
      end
      
      def get_icons_file(manifest_data, dir)
        icons = manifest_data.icons
        
        icons_file = []
        icons.each do |icon|
          icon_size = icon[0]
          icon_file_name = icon[1]
          icon_file_name.slice!(0) # 先頭の/を削除

          icons_file.push({
                              :size => icon_size,
                              :file => get_file(dir, icon_file_name)
                          })
        end
        
        icons_file
      end
      
      def get_file(dir, target_file_name)
        File.open("#{dir}/#{target_file_name}", 'r')
      end
    end
  end
end