require 'spec_helper'

describe FirefoxZip do
  context 'self.analyze' do
    it 'default' do
      app = FirefoxZip.analyze(File.expand_path('../test_files/hello.zip', __FILE__))
      
      expect(app.name).to eq 'hello'
    end
  end
end