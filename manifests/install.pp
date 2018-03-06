# Private class
class passbolt::install inherits passbolt {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  ::vcsrepo { '/var/www/passbolt':
    ensure   => 'present',
    provider => 'git',
    source   => 'https://github.com/passbolt/passbolt_api.git',
  }
}
