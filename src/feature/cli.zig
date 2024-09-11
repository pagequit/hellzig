const io = @import("../core/io.zig");

pub fn readLineUntil(comptime predicate: fn (line: []const u8) bool) !void {
    const input = try io.readLine();

    if (!predicate(input)) {
        try @call(.always_tail, readLineUntil, .{predicate});
    }
}
