require 'spec_helper'

describe FirefoxZip::Valid do
  context 'self.run' do
    before do
      @status, stdout, stderr = systemu 'app-validator --help'
    end

    it 'success' do
      expect { FirefoxZip::Valid.run(File.expand_path('../../test_files/package.zip', __FILE__)) }.not_to raise_error if @status.exitstatus == 0
    end

    it 'error' do
      expect { FirefoxZip::Valid.run(File.expand_path('../../test_files/error_package.zip', __FILE__)) }.to raise_error if @status.exitstatus == 0
    end
  end

end
