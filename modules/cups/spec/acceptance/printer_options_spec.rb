require 'spec_helper_acceptance'

describe 'printer resource options parameter' do

  describe '(issue #38) when setting auth-info-required=negotiate' do
    let(:manifest) {
      <<-EOS
       printer { 'cups_printer_set_authinfo':
          ensure       => present,
          model        => 'drv:///sample.drv/deskjet.ppd',
          description  => 'Generic Test AuthInfo',
          options      => {
            'auth-info-required' => 'negotiate'
          }
       }
      EOS
    }

    it 'should work with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    it 'should be idempotent' do
      apply_manifest(manifest, :catch_changes => true)
    end

    it 'should display auth-info-required=negotiate as part of the options listing' do
      expect(shell("lpoptions -p cups_printer_set_authinfo").stdout).to include("auth-info-required=negotiate")
    end
  end

  describe '(issue #38) when setting auth-info-required=none' do
    let(:manifest) {
      <<-EOS
       printer { 'cups_printer_no_authinfo':
          ensure       => present,
          model        => 'drv:///sample.drv/deskjet.ppd',
          description  => 'Generic Test AuthInfo None',
          options      => {
            'auth-info-required' => 'none'
          }
       }
      EOS
    }

    it 'should work with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    it 'should be idempotent' do
      apply_manifest(manifest, :catch_changes => true)
    end

    it 'should not include auth-info-required as part of the options listing' do
      expect(shell("lpoptions -p cups_printer_no_authinfo").stdout).to include("auth-info-required=none")
    end
  end

  describe 'regression: single quote in option causes parsing of options to fail' do
    let(:manifest) {
      <<-EOS
       printer { 'cups_printer_location_quote':
          ensure       => present,
          model        => 'drv:///sample.drv/deskjet.ppd',
          location     => "John's Office",
       }
      EOS
    }

    it 'should work with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    it 'should be idempotent' do
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  describe 'regression issue #39: error calling include? when options is not set, tries to set every option.' do
    #     On OSX machines I have tested:
    #
    #         lib/puppet/provider/printer/cups.rb: blows up about calling include? on nil when you don't set options.
    #         AND
    #         Continues to try and set every possible option listed by lpoptions -l instead of just the options you pass as a hash.

    let(:manifest) {
      <<-EOS
       printer { 'cups_printer_options_nil':
          ensure       => present,
          model        => 'drv:///sample.drv/deskjet.ppd',
       }
      EOS
    }

    it 'should work with no errors' do
      apply_manifest(manifest, :catch_failures => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  after(:all) do
    # Clean up tests for re-run
    shell("lpadmin -x cups_printer_set_authinfo")
    shell("lpadmin -x cups_printer_no_authinfo")
    shell("lpadmin -x cups_printer_location_quote")
    shell("lpadmin -x cups_printer_options_nil")
  end



end