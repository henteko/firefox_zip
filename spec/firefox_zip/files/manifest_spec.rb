require 'spec_helper'

describe FirefoxZip::Files::Manifest do
  context 'self.get' do
    it 'default' do
      manifest_file = FirefoxZip::Files::Manifest.get(File.expand_path('../../../test_files/hello.zip', __FILE__))
      
      expect(manifest_file.class).to eq File
      expect(File.exists? manifest_file).to be_truthy
      expect(manifest_file.read).not_to eq ''

      manifest_file.close
    end
    
    it 'nil' do
      manifest_file = FirefoxZip::Files::Manifest.get(File.expand_path('nil', __FILE__))

      expect(manifest_file).to be_nil
    end
  end
end