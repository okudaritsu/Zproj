const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{ .default_for_mode = .ReleaseFast });
    const exe = b.addExecutable(.{
        .name = "PROJECTNAME",
        .target = target,
        .optimize = optimize,
    });
    exe.addCSourceFile(.{
        .file = b.path("PROJECTNAME.c"),
        .flags = &.{ "-Wall", "-std=c2x" },
    });
    exe.linkSystemLibrary("bu");
    exe.linkLibC();
    exe.addIncludePath(b.path("."));
    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}