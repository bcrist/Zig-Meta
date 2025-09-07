pub fn Backing(comptime T: type) type {
    return switch (@typeInfo(T)) {
        .@"enum" => |info| info.tag_type,
        .@"union" => |info| info.tag_type orelse @compileError("union " ++ @typeName(T) ++ " has no tag type"),
        .@"struct" => |info| info.backing_integer orelse @compileError("struct " ++ @typeName(T) ++ " is not packed"),
        else => @compileError("expected enum, union, or packed struct type, found '" ++ @typeName(T) ++ "'"),
    };
}
