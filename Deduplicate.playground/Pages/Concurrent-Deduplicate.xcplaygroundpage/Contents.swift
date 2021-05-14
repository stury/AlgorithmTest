//: [Previous](@previous)

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

let concurrent = Async( label: "dedupe" )
var timeInterval1 : TimeInterval = 0.0
var timeInterval2 : TimeInterval = 0.0

concurrent.async( concurrent.createWorkItem { timeInterval1 = measureTime { _ = dedupe(metadata) } } )
concurrent.async( concurrent.createWorkItem { timeInterval2 = measureTime { _ = dedupe2(metadata)} } )
sleep(50)
concurrent.waitForGroupToFinish()

print( timeInterval1 )
print( timeInterval2 )

//: [Next](@next)
