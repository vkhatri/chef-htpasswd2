#
# Cookbook Name:: htpasswd2
# Resource:: file
#
# Copyright 2015, Virender Khatri
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

actions :create, :delete

default_action :create

attribute :auth_file,   :kind_of => String, :name_attribute => true, :default => nil
attribute :auth_users,  :kind_of => Hash, :default => {}
attribute :user,        :kind_of => String, :default => 'root'
attribute :group,       :kind_of => String, :default => 'root'
attribute :mode,        :kind_of => String, :default => 0500
attribute :cookbook,    :kind_of => String, :default => 'htpasswd2'
attribute :template,    :kind_of => String, :default => 'htpasswd.erb'
