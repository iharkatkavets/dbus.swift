// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Core
import Clibdbus

@main
struct DBusSwift: ParsableCommand {
    mutating func run() throws {
        print("Hello, world!")
        hello()
    }
}
