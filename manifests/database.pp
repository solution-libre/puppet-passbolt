# Private class
class passbolt::database inherits passbolt {
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if $passbolt::create_db {
    require ::mysql::server

    ::mysql::db { $passbolt::db_name:
      host     => $passbolt::db_host,
      user     => $passbolt::db_user,
      password => $passbolt::db_pass,
    }
  }
}
