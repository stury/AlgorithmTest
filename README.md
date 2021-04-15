# AlgorithmTest
Test repo for showing GitHub Pages to my local dev group.

# Deduplication

I was curious about the performance characteristics of two different algorithms to deduplicate an array.  So I created a `Swift Playground` to test it out.  For a small data sets, it isn't very measurable.  But as you get larger, the time differential grows exponentially.  The following tables show worst case scenarios (no duplications) for different amounts of data.

| Iterations | Dedupe with Set (seconds) | Dedupe with Array (seconds) |
| ---: | ---: | ---: |
| 100 | 0.18 | 0.20 |
| 1,000 | 6.14 | 10.04 |
| 10,000 | 395.15 | -- |

Xcode's Playground couldn't handle the load at 10,000 items.  So I then created a command line app to do the same thing:

| Iterations | Dedupe with Set (seconds) | Dedupe with Array (seconds) |
| ---: | ---: | ---: |
| 10,000 | 0.0146 | 16.646 | 
| 100,000 |0.184 | 1483.423 |

M1 stats:

| Iterations | Dedupe with Set (seconds) | Dedupe with Array (seconds) |
| ---: | ---: | ---: |
| 10,000 | 0.007 | 7.978 | 
| 100,000| 0.080 | 793.551 |

## Reference

As a reference, here's the code I put together for the test:

```
import Foundation

struct Metadata {
    let shortName : String
    let name : String
    let id : String
}

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

func generateMetaData(_ numItems: Int ) -> [Metadata] {
    var result = [Metadata]()
    
    for index in 0..<numItems {
        result.append(Metadata(shortName: String(index), name: String(index), id: String(index)))
    }
    
    return result
}

func time( _ work: ()->Void ) -> TimeInterval {
    let startTimeInterval = Date().timeIntervalSince1970
    work()
    return Date().timeIntervalSince1970 - startTimeInterval
}


let metadata = generateMetaData(1000)
print( time({
    _ = dedupe(metadata)
} ))

print( time({
    _ = dedupe2(metadata)
} ))
```
