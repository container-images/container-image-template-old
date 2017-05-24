CMD=avocado run
TESTS=*.py
MODULELINT=/usr/share/moduleframework/tools/modulelint/*.py
#

# If you have tests mentioned in config.yaml file
generate:
    generator

check:
    $(CMD) $(TESTS) $(MODULELINT)

all: generate check
