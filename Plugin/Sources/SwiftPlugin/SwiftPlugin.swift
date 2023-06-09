final class Plugin {
    var param1: CInt = 0
    var param2: String = ""
}

@_cdecl("plugin_create")
public func plugin_create(value: CInt) -> OpaquePointer! {
    if (value == 0) {
        return nil
    }
    else {
        let type = Plugin()
        let retained = Unmanaged.passRetained(type).toOpaque()
        return OpaquePointer(retained)
    }
}

@_cdecl("plugin_set_param1")
public func plugin_set_param1(_ type: OpaquePointer, value: CInt) {
    let type = Unmanaged<Plugin>.fromOpaque(UnsafeRawPointer(type)).takeUnretainedValue()
    type.param1 = value
}

@_cdecl("plugin_set_param2")
public func plugin_set_param2(_ type: OpaquePointer, text: OpaquePointer) {
    let type = Unmanaged<Plugin>.fromOpaque(UnsafeRawPointer(type)).takeUnretainedValue()
    type.param2 = String(cString: UnsafePointer<CChar>(text))
}

@_cdecl("plugin_get_sum")
public func plugin_get_sum(_ type: OpaquePointer) -> CInt {
    let type = Unmanaged<Plugin>.fromOpaque(UnsafeRawPointer(type)).takeUnretainedValue()
    return CInt(type.param1 + CInt(type.param2)!)
}

@_cdecl("plugin_destroy")
public func plugin_destroy(_ type: OpaquePointer) {
    _ = Unmanaged<Plugin>.fromOpaque(UnsafeRawPointer(type)).takeRetainedValue()
}
