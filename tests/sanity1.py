#!/usr/bin/python

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
        # Check whether directory exists
        self.run("ls / | grep bin")

    # More examples can be find
    # in https://pagure.io/modularity-testing-framework/blob/master/f/examples/testing-module/skipTest.py
    def test2GccSkipped(self):
        # Test if gcc is not in actual profile, then skip the test
        self.cancel("gcc" not in self.getActualProfile())
        self.start()
        # Check gcc version
        self.run("gcc -v")

if __name__ == '__main__':
    main()
