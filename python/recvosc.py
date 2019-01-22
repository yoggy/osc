#!/usr/bin/python

from pythonosc import dispatcher
from pythonosc import osc_server

def test_handler(addr, val_i, val_f, val_s):
    print("{0} {1} {2} {3}".format(addr, val_i, val_f, val_s))

dispatcher = dispatcher.Dispatcher()
dispatcher.map("/test", test_handler)

server = osc_server.ThreadingOSCUDPServer(("0.0.0.0",7777), dispatcher)
server.serve_forever()

