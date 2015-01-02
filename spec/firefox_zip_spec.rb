require 'spec_helper'

describe FirefoxZip do
  context 'self.analyze' do
    before do
      @app = FirefoxZip.analyze(File.expand_path('../test_files/hello.zip', __FILE__))
    end
    
    it 'get name' do
      expect(@app.name).to eq 'hello'
    end

    it 'get description' do
      expect(@app.description).to eq 'A Hello World app'
    end

    it 'get launch_path' do
      expect(@app.launch_path).to eq '/index.html'
    end

    it 'get icons' do
      expect(@app.icons).not_to be_nil
    end

    it 'get icon' do
      expect(@app.icon).not_to be_nil
    end

    it 'get type' do
      expect(@app.type).to eq 'privileged'
    end

    it 'get permissions' do
      expect(@app.permissions).to match []
    end

    it 'get developer' do
      expect(@app.developer).not_to be_nil
    end

    it 'get locales' do
      expect(@app.locales).not_to be_nil
    end
    
    it 'get default_locale' do
      expect(@app.default_locale).not_to be_nil
    end

    it 'get version' do
      expect(@app.version).not_to be_nil
    end

    it 'get size' do
      expect(@app.size).not_to be_nil
    end
    
    it 'raise' do
      expect{ FirefoxZip.analyze('') }.to raise_error
    end
  end
end