#
# Cookbook Name:: openvswitch
# Resource:: add_br
#
# Author:: Bryan W. Berry <bryan.berry@gmail.com>
# Copyright 2012, Opscode Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :add_br, :del_br

attribute :name,  :kind_of => String, :name_attribute => true
attribute :ports, :kind_of => Array
attribute :vlan, :kind_of => [String,Array], :default => []

def initialize(*args)
  super
  @action = :add_br
end
