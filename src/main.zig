const std = @import("std");
const net = std.net;
const log = std.log;

pub fn main() !void {
    const address = try net.Address.parseIp4("127.0.0.1", 3080);
    var server = try address.listen(net.Address.ListenOptions{});
    defer server.deinit();
    log.info("Listen on {}", .{server.listen_address});

    while (true) {
        const connection = try server.accept();
        log.info("New connection from {}", .{connection.address});
    }
}
