group { "puppet": ensure => "present", }

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd': content => "Ubuntu / NodeJS / ZeroMQ / Python dev box\n" }

package { "curl": ensure => installed }

package { 'wget': ensure => installed }

package { 'python-virtualenv': ensure => installed }

package { 'python-dev': ensure => installed }

package { 'gcc': ensure => installed }

package { 'git': ensure => installed }

package { 'libzmq-dev': ensure => installed }

# MongoDB

package { 'mongodb': ensure => installed }

package { 'mongodb-server': ensure => installed }

# service { 'mongod':
#   enable => true,
#   ensure => running,
#   require => Package["mongodb-server"]
# }

# Node.js

# package { 'nodejs': ensure => installed }
# package { 'npm': ensure => installed }

# Need a more up to date node version than what Ubuntu provides. Use
# trusty build-from-source method.

$node_version = "v0.10.17"
$node_tarball = "node-${node_version}.tar.gz"
$node_url = "http://nodejs.org/dist/${node_version}/${node_tarball}"
$node_dir = "/vagrant/node-${node_version}"

exec { "get-node-tarball":
    cwd => "/vagrant",
    path => ["/usr/bin", "/bin"],
    command => "wget ${node_url} && tar xzf ${node_tarball}",
    creates => $node_dir,
} ->
exec { "build-node":
    cwd => $node_dir,
    command => "/usr/bin/python configure && make && make install",
    timeout => 1800,
    creates => "/usr/local/bin/node"
} ->
exec { "get-meteorite":
    command => "/usr/local/bin/npm install -g meteorite",
    creates => "/usr/local/bin/mrt"
} ->
exec { "install-meteor":
    command => "/bin/sh /vagrant/bash/install-meteor.sh",
    creates => "/usr/local/bin/meteor"
}

#  ->
# exec { "install-node-zmq":
#     command => "/usr/local/bin/npm install zmq -g"
# #    creates => "/usr/local/bin/meteor"
# }

# What seems to work from this point on is:
#   mrt create myapp
#   cd myapp
#   add to/create packages.json: { "zmq": "2.5.0" }
#   mrt add npm
#   add to myapp.js: 
# if (Meteor.isServer) {
#      Meteor.startup(function () {
#         var zmq = Meteor.require("zmq");
#         console.log(zmq);
#      }
# }
# Then,
#   mrt
# You should get a nice dump of info associated w/ the ZeroMQ object.
