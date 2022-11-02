# == Resource: repose::filter::ip_identity
#
# This is a resource for generating ip identity configuration files
#
# === Parameters
#
# [*ensure*]
# Bool.  Ensure config file present/absent
# Defaults to <tt>present</tt>
#
# [*filename*]
# String.  Config filename
# Defaults to <tt>ip-identity.cfg.xml</tt>
#
# [*quality*]
# List of filters by name, which conains a list of headers
# Defaults to <tt>0.2</tt>
#
# [*whitelist*]
# Hash of quality and an array of addresses
# Defaults to <tt>undef</tt>
#
# === Links
#
# * http://wiki.openrepose.org/display/REPOSE/IP+Identity
#
# === Examples
#
# repose::filter::ip_identity {
#   'default':
#     quality => 0.2,
#     whitelist => {
#       quality => 0.3,
#       addresses => ['127.0.0.1'],
#     }
# }
#
# === Authors
#
# * Alex Schultz <mailto:alex.schultz@rackspace.com>
# * Greg Swift <mailto:greg.swift@rackspace.com>
# * c/o Cloud Integration Ops <mailto:cit-ops@rackspace.com>
#
define repose::filter::ip_identity (
  Enum['present','absent'] $ensure = present,
  String $filename  = 'ip-identity.cfg.xml',
  Float $quality   = 0.2,
  Optional[Hash] $whitelist = undef,
) {
### Validate parameters

## ensure
  $file_ensure = $ensure ? {
    'present' => file,
    'absent'  => 'absent',
  }

  if $ensure == present {
##whitelist
    if $whitelist == undef {
      fail('whitelist is a required parameters. see documentation for details.')
    }
    $content_template = template("${module_name}/ip-identity.cfg.xml.erb")
  } else {
    $content_template = undef
  }

## Manage actions

  file { "${repose::configdir}/${filename}":
    ensure  => $file_ensure,
    owner   => $repose::owner,
    group   => $repose::group,
    mode    => $repose::mode,
    require => Class['repose::package'],
    content => $content_template,
  }
}
