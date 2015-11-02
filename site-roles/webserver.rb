name :webserver
description "Installation of all webserver stuff"

run_list *%w(
  nginx
)

default_attributes nginx: {
}
