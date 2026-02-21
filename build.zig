pub fn build(b: *std.Build) void {
    const mod = b.addModule("meta", .{
        .root_source_file = b.path("meta.zig"),
    });

    const tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("test.zig"),
            .optimize = b.standardOptimizeOption(.{}),
            .target = b.standardTargetOptions(.{}),
            .imports = &.{
                .{ .name = "meta", .module = mod },
            },
        }),
    });
    b.step("test", "run all tests").dependOn(&b.addRunArtifact(tests).step);
}

const std = @import("std");
