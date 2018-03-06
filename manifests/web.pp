# Private class
class passbolt::web inherits passbolt {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  require ::apache::mod::headers
  require ::apache::mod::php
  require ::apache::mod::rewrite
  require ::apache::mod::ssl

  if $passbolt::install_php {
    class {'::php':
      extensions => {
        gd      => {},
        gnupg   => {},
        mysqlnd => {},
      }
    }
  }
}
