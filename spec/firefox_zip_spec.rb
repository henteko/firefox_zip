require 'spec_helper'

describe FirefoxZip do
  context 'self.analyze' do
    before do
      @app = FirefoxZip.analyze(File.expand_path('../test_files/package.zip', __FILE__))
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
      expect(@app.type).to eq 'web'
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
    
    it 'to_hash' do
      expect(@app.to_hash.class).to eq Hash
      expect(@app.to_hash.has_key?(:name)).to be_truthy
      expect(@app.to_hash.has_key?(:size)).to be_truthy
      expect(@app.to_hash.has_key?(:version)).to be_truthy
      expect(@app.to_hash.has_key?(:developer)).to be_truthy
      expect(@app.to_hash.has_key?(:locales)).to be_truthy
      expect(@app.to_hash.has_key?(:icons)).to be_truthy

      expect(@app.to_hash.has_key?(:package_path)).to be_falsey
    end

    it 'raise' do
      expect{ FirefoxZip.analyze('') }.to raise_error
    end
  end

  context 'self.analyze valid false' do
    before do
      @status, stdout, stderr = systemu 'app-validator --help'
    end

    it 'not raise error' do
      expect { FirefoxZip.analyze(File.expand_path('../test_files/error_package.zip', __FILE__)) }.not_to raise_error if @status.exitstatus == 0
    end

    it 'raise error' do
      expect { FirefoxZip.analyze(File.expand_path('../test_files/error_package.zip', __FILE__), valid: true) }.to raise_error if @status.exitstatus == 0
    end
  end
end