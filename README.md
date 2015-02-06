openvswitch Cookbook
====================
This cookbook install and configures openvswitch.

* [http://openvswitch.org](http://openvswitch.org)

Requirements
============
#### Platform:
* Debian 6.0+
* Ubuntu 12.04+

#### packages
- `openvswitch-common` - Open vSwitch common components.
- `openvswitch-datapath-dkms` - Open vSwitch datapath module source - DKMS version.
- `openvswitch-switch` - Open vSwitch switch implementations.

Attributes
==========
#### openvswitch::default
* `default['openvswitch']['packages']` - may be use for install openvswitch packages. Default `openvswitch-common`, `openvswitch-datapath-dkms`, `openvswitch-switch`

Usage
-----
#### openvswitch::default

e.g.
Just include `openvswitch` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[openvswitch]"
  ]
}
```

Contributing
============
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Testing
=======

This cookbook is set up to test using
* knife test
* foodcritic
* chefspec
* test-kitchen
* rubocop

To launch all the tests, run:
* bundle install
* bundle exec strainer test

License and Authors
===================
Author:: Dmitry R. <dmitry.r@cyberflow.net>  
Copyright:: 2015, Webzilla LTD.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

