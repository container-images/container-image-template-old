# If you have tests mentioned in config.yaml file
generate:
	mtf-generator

check:
	# mtf ... calls avocado run *.py <path_with_default_checks> like
	# /usr/lib/python2.7/site-packages/moduleframework/tools/*.py
	MODULE=docker mtf

all: check
