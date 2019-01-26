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
