const std = @import("std");

const stdout = std.io.getStdOut();
const stdin = std.io.getStdIn();
var buf: [256]u8 = undefined;

pub fn writeLine(line: []const u8) !void {
    try stdout.writer().print("{s}\n", .{line[0..]});
}

pub fn readLine() ![]const u8 {
    const line = try stdin.reader()
        .readUntilDelimiterOrEof(buf[0..], '\n');

    return line.?;
}
