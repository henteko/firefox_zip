require 'spec_helper'

describe FirefoxZip::Files::Project do
  context 'initialize' do
    before do
      @project = FirefoxZip::Files::Project.new(File.expand_path('../../../test_files/hello.zip', __FILE__))
    end

    it 'get manifest data' do
      expect(@project.manifest_data).not_to be_nil
      expect(@project.manifest_data.class).to eq FirefoxZip::Parses::Manifest
    end
    
    it 'get icon' do
      expect(@project.icon).not_to be_nil
      expect(@project.icon.class).to eq File
    end
    
    it 'get icons' do
      expect(@project.icons).not_to be_nil
      expect(@project.icons.class).to eq Array
    end

    it 'get size' do
      expect(@project.size).not_to be_nil
      expect(@project.size.class).to eq Fixnum
    end

    it 'nil' do
      expect{ FirefoxZip::Files::Project.new(File.expand_path('nil', __FILE__)) }.to raise_error
    end
  end
end