#!/usr/bin/python
class FilterModule(object):
    def filters(self):
        return {
            'to_factory': self.to_factory,
            'to_server_list': self.to_server_list
        }

    def to_factory(self, hostname):
        factory_number = [int(s) for s in hostname.split("-") if s.isdigit()][0]
        if "non-gdk" in hostname:
            factory_number = factory_number + 10
        return f"ip:c_zn1_factory{factory_number}address:port"

    def to_server_list(self, hostname):
        factory = self.to_factory(hostname)
        return f"{factory},3"
