import XCTest
import class Foundation.Bundle

final class AlgorithmTestTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            return
        }

        // Mac Catalyst won't have `Process`, but it is supported for executables.
        #if !targetEnvironment(macCatalyst)

        let fooBinary = productsDirectory.appendingPathComponent("AlgorithmTest")

        let process = Process()
        process.executableURL = fooBinary

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)

        XCTAssertNotEqual(output, nil)
        
        if let output = output {
            print( output )
            
            XCTAssertEqual( output[String.Index(utf16Offset: 0, in: output)], "(" )
            
            let lines = output.split(separator: "\n")
            XCTAssertEqual( lines.count, 2 )

            // I could also parse out the output to make sure I have two lines of two pairs of output.
            for line in lines {
                // make sure each line starts with a "(", and ends with a ")", and has a "," in the middle.
                if let first = line.first, let last = line.last {
                    XCTAssertTrue(first == "(")
                    XCTAssertTrue( last == ")")
                    let firstIndex = String.Index(utf16Offset: 0, in: line)
                    let lastIndex = String.Index(utf16Offset: line.count-1, in: line)
                    
                    let content = line[line.index(after: firstIndex)..<lastIndex]
                    
                    print( content )
                    
                    let splitContent = content.split(separator: ",")
                    for value in splitContent {
                        if let timeInterval = Double(value.trimmingCharacters(in: CharacterSet.whitespaces)) {
                            print( timeInterval )
                        }
                        else {
                            XCTAssertNotNil(nil)
                        }
                    }
                }
            }
        }
        #endif
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
}
