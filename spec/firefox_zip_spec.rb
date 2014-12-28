require 'spec_helper'

describe FirefoxZip do
  context 'self.analyze' do
    it 'default' do
      app = FirefoxZip.analyze('./test_files/hello.zip')
      
      expect(app.name).to eq 'hello'
    end
  end
end