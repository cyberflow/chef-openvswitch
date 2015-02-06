require 'spec_helper'

describe 'openvswitch::default' do
  let(:chef_run)do
    runner = ChefSpec::ServerRunner.new(
      platform: 'ubuntu',
      version: '14.04'
    )
    runner.converge(described_recipe)
  end

  it 'install a packages' do
    expect(chef_run).to install_package('openvswitch-switch')
    expect(chef_run).to install_package('openvswitch-common')
    expect(chef_run).to install_package('openvswitch-datapath-dkms')
  end
end
