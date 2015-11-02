name :appserver
description "Installation of all appserver stuff"

run_list *%w(
  passenger
)
