require 'spec_helper'

describe FirefoxZip::Parses::Manifest do
  context 'initialize' do
    before do
      file = File.open(File.expand_path('../../../test_files/manifest.webapp', __FILE__), 'r')
      @manifest = FirefoxZip::Parses::Manifest.new(file.read)
      
      file.close
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
      expect(@manifest.icon).to eq "/icons/icon128x128.png"
    end
    
    it 'get type' do
      expect(@manifest.type).to eq 'web'
    end
    
    it 'get permissions' do
      expect(@manifest.permissions).to match []
    end
    
    it 'get developer' do
      expect(@manifest.developer).to include("name" => "henteko",
                                             "url"  => "http://henteko07.com")
    end

    it 'get locales' do
      expect(@manifest.locales).to include("ja" => {"name" => "test", "description" => "test"})
    end
    
    it 'get default_locale' do
      expect(@manifest.default_locale).to eq 'ja'
    end

    it 'get version' do
      expect(@manifest.version).to eq 1.0
      expect(@manifest.version.class).to eq Float
    end

    it 'blank' do
      expect{ FirefoxZip::Parses::Manifest.new('') }.to raise_error
    end
  end
end