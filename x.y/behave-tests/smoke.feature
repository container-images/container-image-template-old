Feature: Smokish smoke

    Scenario: Running ls in module
        # Test if bin exists
        When run 'ls / | grep bin'

    @wip
    Scenario: Set/Get data
        # This connects to specific port defined in config.yaml.
        Given connected to module
        # Send a data to specific port
        When send 'set Test 0 100 4\r\ndata\r\n'
        # Receive data from specic port
        Then receive 'STORED\r\n'
        # Send command for getting value Test
        When send 'get Test\r\n'
        Then receive 'VALUE Test 0 4\r\ndata\r\nEND\r\n'
