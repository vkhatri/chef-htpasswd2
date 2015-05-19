#
# Cookbook Name:: htpasswd2
# Provider:: file
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

def whyrun_supported?
  true
end

action :create do
  new_resource.updated_by_last_action(auth_file_template)
end

action :delete do
  new_resource.updated_by_last_action(auth_file_template)
end

protected

# collect user resources
def user_resources
  run_context.resource_collection.select do |resource|
    resource.is_a?(Chef::Resource::Htpasswd2User)
  end
end

# collect auth users for file resource
def users
  auth_users = {}
  user_resources.reduce({}) do |_hash, resource|
    next unless resource.action == :add
    fail 'invalid auth user detected' if !resource.auth_user || resource.auth_user.empty?
    fail "auth user #{resource.auth_user} does not have a valid password hash" unless resource.auth_password
    fail "auth user #{resource.auth_user} does not have a valid htpasswd file" unless resource.auth_password
    auth_users[resource.auth_user.to_sym] = resource.auth_password if new_resource.auth_file == resource.auth_file
  end
  auth_users
end

def auth_file_template
  case new_resource.action
  when :create
    file_auth_users = Hash[Hash[new_resource.auth_users.map { |(k, v)| [k.to_sym, v] }].merge!(users).sort]

    t = template new_resource.auth_file do
      owner new_resource.user
      group new_resource.group
      mode new_resource.mode
      source new_resource.template
      cookbook new_resource.cookbook
      variables(:auth_users => file_auth_users)
    end
    t.updated?
  when :delete
    f = file new_resource.auth_file do
      action :delete
    end
    f.updated?
  when :nothing
    false
  end
end
