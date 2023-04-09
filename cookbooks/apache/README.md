# apache

TODO: Enter the cookbook description here.

Commands
cd /root/devops/chef-repo
chef generate cookbook cookbooks/create_user


#With ohai we can login to chef-client machine and see the configuration


knife node run_list add chefNode1 'recipe[create_user::default]'

After this run chef-client in your node

https://subscription.packtpub.com/book/web-development/9781785287947/1/ch01lvl1sec14/creating-and-using-cookbooks

Now we wil create a lot of users

How to install ntp to sync timer in CENTOS 8 

https://www.tecmint.com/install-ntp-in-rhel-8/



Roles
Check if you are connected to Chef server

root@84f24454a54f:~/devops/chef-repo# knife client list
chefNode1
subarna-chef-validator

Check the nodes avaialble
root@84f24454a54f:~/devops/chef-repo# knife node list
chefNode1

Check the run list of a node
root@84f24454a54f:~/devops/chef-repo# knife node show chefNode1
Node Name:   chefNode1
Environment: _default
FQDN:        centos8
IP:          10.0.2.15
Run List:    recipe[apache::default], recipe[create_user::default]
Roles:       
Recipes:     apache, apache::default, create_user, create_user::default
Platform:    centos 8
Tags:        


Create new Role and Upload
$vi role/web.json
{
    "name" : "webserver",
    "description" : "",
    "json_class" : "Chef::Role",
    "default_attributes" : {

    },
    "chef-type" : "role",
    "run_list" : [
        "recipe[create_user]",
        "recipe[apache]"    
    ],
    "env_run_lists" : {}
}

Then Upload the role

root@84f24454a54f:~/devops/chef-repo# knife role from file roles/web.json 
Updated Role webserver
root@84f24454a54f:~/devops/chef-repo# knife role list
webserver


=========
Now we will pass default_attributes
{
    "name" : "webserver",
    "description" : "",
    "json_class" : "Chef::Role",
    "default_attributes" : {
        "users" : {
            "list" : [ "john" , "matt"]
        }
    },
    "chef-type" : "role",
    "run_list" : [
        "recipe[create_user]",
        "recipe[apache]"    
    ],
    "env_run_lists" : {}
}


Then upload it in Chef Server 

root@84f24454a54f:~/devops/chef-repo# knife role from file roles/web.json 
Updated Role webserver
root@84f24454a54f:~/devops/chef-repo# knife role show webserver

=======Configure Chef Server to run in every minute==========
edit 




