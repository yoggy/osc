# python-osc (for python3)
## URL

  - https://github.com/attwad/python-osc

## setup

    $ pip install python-osc

## send

    #!/usr/bin/python
    from pythonosc import osc_message_builder
    from pythonosc import udp_client
    
    client = udp_client.SimpleUDPClient("127.0.0.1", 7777)
    client.send_message("/test", (123, 123.456, "test1234"))

## receive

    #!/usr/bin/python
    from pythonosc import dispatcher
    from pythonosc import osc_server
    
    def test_handler(addr, val_i, val_f, val_s):
        print("{0} {1} {2} {3}".format(addr, val_i, val_f, val_s))
    
    dispatcher = dispatcher.Dispatcher()
    dispatcher.map("/test", test_handler)
    
    server = osc_server.ThreadingOSCUDPServer(("0.0.0.0",7777), dispatcher)
    server.serve_forever()

