#!/usr/bin/python

from pythonosc import osc_message_builder
from pythonosc import udp_client

client = udp_client.SimpleUDPClient("127.0.0.1", 7777)
client.send_message("/test", (123, 123.456, "test1234"))

