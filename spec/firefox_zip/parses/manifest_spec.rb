require 'spec_helper'

describe FirefoxZip::Parses::Manifest do
  context 'initialize' do
    before do
      @manifest = FirefoxZip::Parses::Manifest.new(File.expand_path('../../../test_files/manifest.webapp', __FILE__))
    end
    
    it 'get name' do
      expect(@manifest.name).to eq 'hello'
    end
    
    it 'get description' do
      expect(@manifest.description).to eq 'A Hello World app'
    end
    
    it 'get launch_path' do
      expect(@manifest.launch_path).to eq '/index.html'
    end
    
    it 'get icons' do
      expect(@manifest.icons).to include("16"  => "/icons/icon16x16.png",
                                        "48"  => "/icons/icon48x48.png",
                                        "60"  => "/icons/icon60x60.png",
                                        "128" => "/icons/icon128x128.png")
    end
    
    it 'get icon' do
      expect(@manifest.icon).to eq "/icons/icon16x16.png"
    end
    
    it 'get type' do
      expect(@manifest.type).to eq 'privileged'
    end
    
    it 'get permissions' do
      expect(@manifest.permissions).to match []
    end
  end
end