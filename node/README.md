# osc.js (for node.js)
## URL

  - https://github.com/colinbdclark/osc.js

## setup

    $ mkdir node-osc-example
    $ cd node-osc-example
    $ vi package.json

    {
        "name": "node-osc-example",
        "version": "0.0.1",
        "dependencies": {
            "osc": ""
        }
    }

    $ npm install

## send

    var osc = require("osc")
    
    var udpPort = new osc.UDPPort({
        remoteAddress: "127.0.0.1",
        remotePort: 7777,
    })
    
    udpPort.open()
    udpPort.on("ready", function () {
        var msg = {
            address: "/test",
            args: [1234, 123.456, "test1234"]
        }
        udpPort.send(msg)
    })


## receive

    var osc = require("osc");
    
    var udpPort = new osc.UDPPort({
        localAddress: "0.0.0.0",
        localPort: 7777,
    })
    
    udpPort.on("message", function (msg) {
        console.dir(msg)
        if (msg.address === "/test") {
    	var val_i = msg.args[0]
    	var val_f = msg.args[1]
    	var val_s = msg.args[2]
    	console.log("val_i=" + val_i + ", val_f=" + val_f + ", val_s=" + val_s)
        }
    })
    
    udpPort.open()


