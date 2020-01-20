# ansible-role-amazon-cloudwatch

[![Build Status](https://travis-ci.com/diodonfrost/ansible-role-amazon-cloudwatch.svg?branch=master)](https://travis-ci.com/diodonfrost/ansible-role-amazon-cloudwatch)
[![Ansible Galaxy](https://img.shields.io/badge/galaxy-diodonfrost.amazon_cloudwatch-660198.svg)](https://galaxy.ansible.com/diodonfrost/amazon_cloudwatch)

This role provide a compliance for install amazon-cloudwatch on your target host.

## Requirements

This role was developed using Ansible 2.5 Backwards compatibility is not guaranteed.
Use `ansible-galaxy install diodonfrost.amazon_cloudwatch` to install the role on your system.

Supported platforms:

```yaml
- name: EL
  versions:
    - 8
    - 7
    - 6
- name: Debian
  versions:
    - buster
    - stretch
    - jessie
- name: Ubuntu
  versions:
    - disco dingo
    - bionic
    - xenial
    - trusty
- name: Amazon
  versions:
    - 2017.12
    - 2016.03
- name: opensuse
  versions:
    - 15.1
    - 15
```

## Role Variables

This role does not have a variable

```yaml
---
# defaults file for ansible-role-amazon-cloudwatch

cloudwatch_config: '{
	"agent": {
		"metrics_collection_interval": 60,
		"run_as_user": "root"
	},
	"metrics": {
		"metrics_collected": {
			"collectd": {
				"metrics_aggregation_interval": 60
			},
			"cpu": {
				"measurement": [
					"cpu_usage_idle"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				],
				"totalcpu": true
			},
			"disk": {
				"measurement": [
					"used_percent"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"diskio": {
				"measurement": [
					"write_bytes",
					"read_bytes",
					"writes",
					"reads"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"mem": {
				"measurement": [
					"mem_used_percent"
				],
				"metrics_collection_interval": 60
			},
			"net": {
				"measurement": [
					"bytes_sent",
					"bytes_recv",
					"packets_sent",
					"packets_recv"
				],
				"metrics_collection_interval": 60,
				"resources": [
					"*"
				]
			},
			"statsd": {
				"metrics_aggregation_interval": 60,
				"metrics_collection_interval": 10,
				"service_address": ":8125"
			},
			"swap": {
				"measurement": [
					"swap_used_percent"
				],
				"metrics_collection_interval": 60
			}
		}
	}
}'

# Use during integration test
ansible_test_mode: false
```

## Dependencies

None

## Example Playbook

This is a sample playbook file for deploying the Ansible Galaxy 
role in a localhost and installing latest amazon-cloudwatch version.

```yaml
---
- hosts: localhost
  become: true
  roles:
    - role: diodonfrost.amazon_cloudwatch
```

## Local Testing

The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system.

Next install test-kitchen:

```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing with Docker

```shell
# List all tests with kitchen
kitchen list

# fast test on one machine
kitchen test default-centos-8

# test on all machines
kitchen test

# for development, create environment
kitchen create default-centos-8

# Apply ansible playbook
kitchen converge default-centos-8

# Apply inspec tests
kitchen verify default-centos-8
```

## License

Apache 2

## Author Information

This role was created in 2019 by diodonfrost.
