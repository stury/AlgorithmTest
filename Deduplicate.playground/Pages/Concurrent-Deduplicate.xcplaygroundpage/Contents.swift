//: [Previous](@previous)

import Foundation

//struct Metadata {
//    let shortName : String
//    let name : String
//    let id : String
//}
//
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
//let concurrent = Async( label: "dedupe" )
//concurrent.async( concurrent.createWorkItem { _ = dedupe(metadata) } )
//concurrent.async( concurrent.createWorkItem { _ = dedupe2(metadata) } )
//concurrent.waitForGroupToFinish()

//print(time { _ = dedupe(metadata)  })
//print(time { _ = dedupe2(metadata) })

let queue = DispatchQueue(label: "com.tury.concurrent", qos: .userInitiated, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
let group = DispatchGroup()

func createWorkItem( closure: @escaping(()->Void) ) -> DispatchWorkItem {
    let result = DispatchWorkItem {
        let result = measureTime {
            closure()
        }
        DispatchQueue.main.async {
            print(result)
        }
    }
    return result
}

queue.async(execute: createWorkItem { _ = dedupe(metadata) } )
queue.async(execute: createWorkItem { _ = dedupe2(metadata) } )
group.wait()


//: [Next](@next)
