# Private class
class passbolt::web inherits passbolt {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  class {'apache':
    mpm_module      => 'event',
    purge_vhost_dir => true,
  }
  require ::apache::mod::fcgid
  require ::apache::mod::headers
  require ::apache::mod::proxy
  require ::apache::mod::rewrite
  require ::apache::mod::ssl

  if $passbolt::install_php {
    class {'::php::globals':
      php_version => '7.0',
    }
    class {'::php':
      extensions => {
        gd      => {},
        gnupg   => {
          package_prefix => 'php-',
        },
        mysql => {
          so_name => 'mysqlnd',
        },
      }
    }
  }
}
