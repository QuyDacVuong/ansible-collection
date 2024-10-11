#!/usr/bin/python

import unittest


class FilterModule(object):
    def filters(self):
        return {
            'to_jdbc': self.to_jdbc,
            'to_host_port': self.to_host_port,
            'to_db_net_response': self.to_db_net_response,
            'to_unique_db_hosts': self.to_unique_db_hosts,
        }

    def to_jdbc(self, db):
        return f"{db['host']}:{db['port']}/{db['dbname']}"

    def to_host_port(self, db):
        return f"{db['host']}:{db['port']}"

    def to_db_net_response(self, db):
        return f'[[inputs.net_response]]\n  protocol = "tcp"\n  address = "{ self.to_host_port(db) }"\n  interval = "60s"\n  collection_jitter = "20s"\n'

    def to_unique_db_hosts(self, dbs):
        seen = {}
        result = []
        for db in dbs:
            if self.to_host_port(db) not in seen:
                seen[self.to_host_port(db)] = True
                result.append(db)
        return result


class TestFilterModule(unittest.TestCase):
    def setUp(self):
        self.filter_module = FilterModule()
        self.db_config = {'host': '127.0.0.1', 'port': 50000, 'dbname': 'ALICE'}
    def test_to_host_port(self):
        expected_output = "127.0.0.1:50000"
        result = self.filter_module.to_host_port(self.db_config)
        self.assertEqual(result, expected_output)
    def test_to_jdbc(self):
        expected_output = "127.0.0.1:50000/ALICE"
        result = self.filter_module.to_jdbc(self.db_config)
        self.assertEqual(result, expected_output)
    def test_to_net_response(self):
        expected_output = """[[inputs.net_response]]
  protocol = "tcp"
  address = "127.0.0.1:50000"
  interval = "60s"
  collection_jitter = "20s"
"""
        result = self.filter_module.to_db_net_response(self.db_config)
        self.assertEqual(result, expected_output)
    def test_to_unique_db_hosts(self):
        dbs = [
                {'host': '127.0.0.1', 'port': 50000, 'dbname': 'ALICE'},
                {'host': '127.0.0.1', 'port': 50000, 'dbbane': 'BOB'},
                {'host': '127.0.0.2', 'port': 90000, 'dbname': 'CAROL'}
              ]
        result = self.filter_module.to_unique_db_hosts(dbs)
        self.assertEqual(len(result), 2)

if __name__ == "__main__":
    unittest.main()
