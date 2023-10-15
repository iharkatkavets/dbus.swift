struct WrapperError: Error {
    var message: String?

    init(_ message: String? = nil) {
        self.message = message
    }
}
