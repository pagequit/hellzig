const cli = @import("feature/cli.zig");

pub fn main() !void {
    // try cli.open();

    var buf: [1024]u8 = undefined;
    const input = try cli.makePrompt(&buf, "> ");

    try cli.printLine(input.?);
    try cli.printLine(&buf);
}
