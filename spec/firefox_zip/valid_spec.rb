require 'spec_helper'

describe FirefoxZip::Valid do
  context 'self.run' do
    it 'success' do
      expect { FirefoxZip::Valid.run(File.expand_path('../../test_files/package.zip', __FILE__)) }.not_to raise_error
    end

    it 'error' do
      expect { FirefoxZip::Valid.run(File.expand_path('../../test_files/error_package.zip', __FILE__)) }.to raise_error
    end
  end

end
