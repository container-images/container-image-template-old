# TODO: commented becasue MTF generates enormous amount of logs
# CMD=avocado run --show-job-log
CMD=avocado run
TESTS=*.py
MODULELINT=/usr/share/moduleframework/tools/modulelint/*.py
#

# If you have tests mentioned in config.yaml file
generate:
	mtf-generator

check:
	MODULE=docker $(CMD) $(TESTS) $(MODULELINT)

all: check
