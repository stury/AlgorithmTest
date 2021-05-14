import Foundation

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

let metadata = generateMetaData(1000)

print(measureTime { _ = dedupe(metadata)  })
print(measureTime { _ = dedupe2(metadata) })

//: [Next](@next)
