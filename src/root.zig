const std = @import("std");
const testing = std.testing;

export fn crash(a: usize, b: usize) usize {
    // will underflow on subtraction
    return a - b;
}
