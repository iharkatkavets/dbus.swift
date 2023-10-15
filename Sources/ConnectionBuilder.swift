import Clibdbus

public final class ConnectionBuilder {
    public init() {}

    public func makeSessionBusConnection() throws -> Connection {
        var error: DBusError = DBusError()
        dbus_error_init(&error)
        let connection = dbus_bus_get(DBUS_BUS_SESSION, &error)

        if dbus_error_is_set(&error) != 0 {
            dbus_error_free(&error)
            throw WrapperError()
        }

        if connection == nil {
            throw WrapperError()
        }

        return Connection(connection!)
    }
}
