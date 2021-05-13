import Foundation

import Foundation

public struct Metadata {
    public let shortName : String
    public let name : String
    public let id : String
    
    public init(shortName: String, name: String, id: String) {
        self.shortName = shortName
        self.name = name
        self.id = id
    }
}

public func generateMetaData(_ numItems: Int ) -> [Metadata] {
    var result = [Metadata]()
    
    for index in 0..<numItems {
        result.append(Metadata(shortName: String(index), name: String(index), id: String(index)))
    }
    
    return result
}

public func measureTime( _ work: ()->Void ) -> TimeInterval {
    let startTimeInterval = Date().timeIntervalSince1970
    work()
    return Date().timeIntervalSince1970 - startTimeInterval
}
