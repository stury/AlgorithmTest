import Foundation

//struct Metadata {
//    let shortName : String
//    let name : String
//    let id : String
//}

func dedupe(_ filtered: [Metadata]) -> [Metadata] {
    var lookup = Set<String?>()
    var deduped = [Metadata]()
    for metadata in filtered {
        if lookup.contains(metadata.shortName) == false {
            deduped.append(metadata)
             lookup.insert(metadata.shortName)
         }
     }
     return deduped
}

func dedupe2(_ filtered: [Metadata]) -> [Metadata] {
    var deduped = [Metadata]()
    for metadata in filtered {
        if deduped.contains(where: { return $0.shortName == metadata.shortName }) == false {
            deduped.append(metadata)
         }
     }
     return deduped
}

//func generateMetaData(_ numItems: Int ) -> [Metadata] {
//    var result = [Metadata]()
//
//    for index in 0..<numItems {
//        result.append(Metadata(shortName: String(index), name: String(index), id: String(index)))
//    }
//
//    return result
//}
//
//func time( _ work: ()->Void ) -> TimeInterval {
//    let startTimeInterval = Date().timeIntervalSince1970
//    work()
//    return Date().timeIntervalSince1970 - startTimeInterval
//}


let metadata = generateMetaData(1000)

print(measureTime { _ = dedupe(metadata)  })
print(measureTime { _ = dedupe2(metadata) })

//: [Next](@next)
