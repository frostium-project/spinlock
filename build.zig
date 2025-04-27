const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("spinlock", .{
        .root_source_file = b.path("spinlock.zig"),
    });

    const unit_tests = b.addTest(.{
        .root_source_file = b.path("spinlock.zig"),
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}
