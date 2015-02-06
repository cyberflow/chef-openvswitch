def whyrun_supported?
  true
end

use_inline_resources

action :add_br do
  if br_exists?(new_resource.name)
    cmd_str = "ovs-vsctl add-br #{new_resource.name}"
    execute cmd_str do
      Chef::Log.debug "ovs_add_br: #{cmd_str}"
      Chef::Log.info "Create new ovs bridge: #{new_resource.name}"
      new_resource.updated_by_last_action(true)
    end
  else
    Chef::Log.info "Bridge #{new_resource.name} already exists - nothing to do"
  end
  if new_resource.ports
    new_resource.ports.each do |port|
      if port_exists?(new_resource.name, port)
        cmd_str = "ovs-vsctl add-port #{new_resource.name} #{port}"
        execute cmd_str do
          Chef::Log.debug "ovs_add_port: #{cmd_str}"
          Chef::Log.info "Add port #{port} to ovs bridge #{new_resource.name}"
          new_resource.updated_by_last_action(true)
        end
      else
        Chef::Log.info "Port #{port} already add - nothing to do"
      end
    end
  end
end

action :del_br do
  if br_exists?(new_resource.name)
    Chef::Log.info "Bridge #{new_resource.name} not exists - nothing to do"
  else
    cmd_str = "ovs-vsctl del-br #{new_resource.name}"
    execute cmd_str do
      Chef::Log.debug "ovs_add_br: #{cmd_str}"
      Chef::Log.info "Delete ovs bridge: #{new_resource.name}"
      new_resource.updated_by_last_action(true)
    end
  end
end

def br_exists?(br)
  cmd_str = "ovs-vsctl br-exists #{br}"
  cmd = Mixlib::ShellOut.new(cmd_str)
  cmd.run_command
  Chef::Log.debug "ovs_br_exists?: #{cmd_str}"
  begin
    cmd.error!
    false
  rescue
    true
  end
end

def port_exists?(br, port)
  cmd_str = "ovs-vsctl list-ports #{br}|grep '^#{port}'"
  cmd = Mixlib::ShellOut.new(cmd_str)
  cmd.run_command
  Chef::Log.debug "ovs_port_exists?: #{cmd_str}"
  begin
    cmd.error!
    false
  rescue
    true
  end
end
