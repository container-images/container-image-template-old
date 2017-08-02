#!/usr/bin/python

import os
import socket
from avocado import main
from avocado.core import exceptions
from moduleframework import module_framework


# THESE TESTS ARE EXECUTED ON HOST

class SanityCheck1(module_framework.AvocadoTest):
    """
    :avocado: enable
    """

    def test1(self):
        self.start()
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # Connect to port specified by config.yaml file
        s.connect(('localhost', self.getConfig()['service']['port']))
        # Send a data to service via port
        s.sendall('set Test 0 100 4\r\n\n')
        # print data
        s.sendall('get Test\r\n')
        s.close()

    def test2(self):
        self.start()
        # Check whether directory exists
        self.run("ls / | grep bin")

    # More examples can be find
    # in https://pagure.io/modularity-testing-framework/blob/master/f/examples/testing-module/skipTest.py
    def test3GccSkipped(self):
        # Test if gcc is not in actual profile, then skip the test
        self.cancel("gcc" not in self.getActualProfile())
        self.start()
        # Check gcc version
        self.run("gcc -v")

    def testVersionSpecific(self):
        version = os.environ.get('VERSION')
        if version == 'x.y':
            pass  # some version-specific test goes here

if __name__ == '__main__':
    main()
