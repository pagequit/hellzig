const std = @import("std");
const cli = @import("feature/cli.zig");

fn predicate(line: []const u8) bool {
    if (std.mem.eql(u8, line, "quit")) {
        return true;
    }

    std.debug.print("input: '{s}'\n", .{line[0..]});

    return false;
}

pub fn main() !void {
    try cli.readLineUntil(predicate);
}
