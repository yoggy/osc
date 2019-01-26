var osc = require("osc");

var udpPort = new osc.UDPPort({
    remoteAddress: "127.0.0.1",
    remotePort: 7777,
    metadata: true
})

udpPort.open()
udpPort.on("ready", function () {
    var msg = {
        address: "/test",
        args: [
            {
                type: "i",
                value: 1234
            },
            {
                type: "f",
                value: 123.456
            },
            {
                type: "s",
                value: "test1234"
            }
        ]
    };
    udpPort.send(msg);
})

