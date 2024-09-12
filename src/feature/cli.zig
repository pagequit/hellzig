const std = @import("std");

const stdout = std.io.getStdOut();
const stdin = std.io.getStdIn();

fn handle(line: ?[]const u8) bool {
    const input = line orelse "";
    if (std.mem.eql(u8, input, "quit")) {
        return true;
    }

    if (std.mem.eql(u8, input, "help")) {
        printLine("This is the hellzig cli help response.");
    }

    return false;
}

pub fn open() !void {
    var buf: [1024]u8 = undefined;
    try readLineUntil(handle, buf[0..]);
}

pub fn makePrompt(buf: []u8, prompt: []const u8) !?[]const u8 {
    _ = try stdout.write(prompt);
    return try readLine(buf);
}

pub fn printLine(line: []const u8) !void {
    try stdout.writer().print("{s}\n", .{line});
}

pub fn readLine(buf: []u8) !?[]const u8 {
    return try stdin.reader().readUntilDelimiterOrEof(buf, '\n');
}

pub fn readLineUntil(comptime predicate: fn (line: ?[]const u8) bool, buf: []u8) !void {
    const line = try readLine(buf);
    if (!predicate(line)) {
        try @call(.always_tail, readLineUntil, .{ predicate, buf });
    }
}
