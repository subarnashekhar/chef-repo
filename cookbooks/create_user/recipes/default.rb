#
# Cookbook:: create_user
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.


group 'developer' do
    gid '2000'
    action :create
end

#users = [ 'user1' , 'user2' , 'user3' , 'user4']

users = node['users']['list']



for index in (0...users.length)
    user users[index] do
        comment 'User #{users[index]}'
        uid (rand 1000 .. 9999)
        gid '2000'
        home '/home/#{users[index]}'
        shell '/bin/bash'
        password 'password'
    end
end