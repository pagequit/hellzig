const std = @import("std");
const net = std.net;

pub fn main() !void {
    const address = try net.Address.parseIp4("127.0.0.1", 3080);
    const stream = try net.tcpConnectToAddress(address);
    defer stream.close();
}
