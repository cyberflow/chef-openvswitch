default['openvswitch']['packages'] = if node['platform_version'].to_f >= 16.04
  ['openvswitch-common', 'openvswitch-switch']
else
  ['openvswitch-datapath-dkms', 'openvswitch-common', 'openvswitch-switch']
end
