
test "meta.Backing" {
    const E = enum(u8) {
        C = 33,
        D,
    };
    const U = union(E) {
        C: u8,
        D: u16,
    };
    const S = packed struct(u16) {
        x: u7,
        y: u9,
    };

    try std.testing.expect(meta.Backing(E) == u8);
    try std.testing.expect(meta.Backing(U) == E);
    try std.testing.expect(meta.Backing(S) == u16);
}

const meta = @import("meta");
const std = @import("std");
