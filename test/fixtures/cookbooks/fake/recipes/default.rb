include_recipe 'openvswitch::default'

openvswitch_bridge 'test0' do
  ports ['lo']
end

openvswitch_bridge 'test0' do
  ports ['lo']
end

openvswitch_bridge 'test0' do
  action :del_br
end
