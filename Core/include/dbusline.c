#include "dbusline.h"
#include <stdio.h>
#include <dbus/dbus.h>

void hello() {
    printf("print the all available services in DBUS");
    DBusError error;
    dbus_error_init(&error);

    DBusConnection *connection;
    DBusMessage *message;
    DBusMessageIter args;

    connection = dbus_bus_get(DBUS_BUS_SESSION, &error);
    if (dbus_error_is_set(&error)) {
        fprintf(stderr, "Connection Error (%s)\n", error.message);
        dbus_error_free(&error);
    }
    if (connection == NULL) {
        return;
    }

    // Create a new method call message
    message = dbus_message_new_method_call(
        "org.freedesktop.DBus",        // Destination
        "/org/freedesktop/DBus",       // Object path
        "org.freedesktop.DBus",        // Interface
        "ListNames"                    // Method
    );

    if (message == NULL) {
        fprintf(stderr, "Message Null\n");
        return;
    }

    // Send the message and get a reply
    DBusPendingCall *pending;
    if (!dbus_connection_send_with_reply(connection, message, &pending, -1)) {
        fprintf(stderr, "Out Of Memory!\n");
        return;
    }
    if (pending == NULL) {
        fprintf(stderr, "Pending Call Null\n");
        return;
    }

     dbus_connection_flush(connection);

     dbus_pending_call_block(pending);

     DBusMessage *reply = dbus_pending_call_steal_reply(pending);
     if (reply != NULL) {
         /*
         if (dbus_message_is_method_return(reply)) {
             dbus_error_init(&error);
             if (!dbus_message_get_args(reply, &error, DBUS_TYPE_STRING, &result, DBUS_TYPE_INVALID)) {
                 // Handle error, e.g., print the error message
                 fprintf(stderr, "Error: %s\n", error.message);
                 dbus_error_free(&error);
             } else {
                 // Process the result (in this example, it's a string)
                 printf("Received result: %s\n", result);
             }
         }

         dbus_message_unref(reply);
         */
     }

     dbus_pending_call_unref(pending);
     dbus_message_unref(message);
}

