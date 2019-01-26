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

