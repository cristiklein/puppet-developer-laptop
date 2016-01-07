require 'spec_helper_acceptance'

test_name "cups::init class"

describe 'cups::init' do
  let(:manifest) {
    <<-EOS
      class { 'cups': }
    EOS
  }

  it 'should work with no errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should be idempotent' do
    apply_manifest(manifest, :catch_changes => true)
  end

  it 'should install the cups package' do
    expect(shell("puppet resource package cups").stdout).to_not include('absent')
  end

  it 'should ensure that the cups service is running' do
    expect(shell("puppet resource service cups").stdout).to include('running')
  end
end

describe 'cups { service_ensure => stopped }' do
  let(:manifest) {
    <<-EOS
      class { 'cups':
        service_ensure => stopped,
      }
    EOS
  }

  it 'should work with no errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should be idempotent' do
    apply_manifest(manifest, :catch_changes => true)
  end

  it 'should stop the cups service' do
    expect(shell("puppet resource service cups").stdout).to include('stopped')
  end
end

describe 'cups { package_ensure => absent }' do
  # If the service parameter is absent, removing the package makes each application fail.
  let(:manifest) {
    <<-EOS
      class { 'cups':
        package_ensure => absent,
        service_ensure => stopped,
      }
    EOS
  }

  it 'should work with no errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should be idempotent' do
    apply_manifest(manifest, :catch_changes => true)
  end

  it 'should remove the cups package' do
    expect(shell("puppet resource package cups").stdout).to include('absent')
  end
end

describe 'cups { service_enabled => false }' do
  let(:manifest) {
    <<-EOS
      class { 'cups':
        service_enabled => false,
      }
    EOS
  }

  it 'should work with no errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should be idempotent' do
    apply_manifest(manifest, :catch_changes => true)
  end

  it 'should disable the cups service' do
    expect(shell("puppet resource service cups").stdout).to include("enable => 'false'")
  end
end

