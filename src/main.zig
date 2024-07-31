const std = @import("std");

const fn_signature = fn (usize, usize) usize;
fn crash_exe(a: usize, b: usize) usize {
    return a - b;
}

pub fn main() !void {
    var dll_file = try std.DynLib.open("zig-out/bin/shared_crash_test.dll");
    const crash_dll = dll_file.lookup(*fn_signature, "crash").?;
    const crash_val2 = crash_dll(1, 7);
    _ = crash_val2;
    // const crash_val1 = crash_exe(5, 6);
    // _ = crash_val1;
}
