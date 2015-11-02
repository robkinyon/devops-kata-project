name :datastore
description "Installation of all datastore stuff"

run_list *%w(
  redisio
  redisio::enable
)

default_attributes redisio: {
  package_install: true,
  package_name: 'redis-server',
}
