#!/bin/bash

rm -f $CONFIG_DATABASE
m2sh load -config 'data/default_mongrel2.conf' -db $CONFIG_DATABASE
