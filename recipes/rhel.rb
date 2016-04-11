#
# Cookbook Name:: threatstack
# Recipe:: rhel
#
# Copyright 2014-2015, Threat Stack
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

execute 'ts-gpg-fetch' do
  command "wget #{node['threatstack']['repo']['key']} -O #{node['threatstack']['repo']['key']}"
  creates node['threatstack']['repo']['key_file_uri']
end

yum_repository 'threatstack' do
  description 'Threat Stack'
  baseurl node['threatstack']['repo']['url']
  gpgkey node['threatstack']['repo']['key_file_uri']
  action :add
end
