import Clibdbus

public final class Connection {
   private var dbusConnection: OpaquePointer

   public init(_ dbusConnection: OpaquePointer) {
       self.dbusConnection = dbusConnection
   }
}
