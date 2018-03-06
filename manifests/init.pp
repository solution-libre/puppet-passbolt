# passbolt
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include passbolt
class passbolt (
  Boolean $create_db   = true,
  String $db_host      = 'locahost',
  String $db_name      = 'passbolt',
  String $db_pass      = 'passbolt',
  String $db_user      = 'passbolt',
  Boolean $install_php = true,
){
  anchor { "${module_name}::begin": }
  -> class { "${module_name}::database": }
  -> class { "${module_name}::web": }
  -> class { "${module_name}::install": }
  -> anchor { "${module_name}::end": }
}
