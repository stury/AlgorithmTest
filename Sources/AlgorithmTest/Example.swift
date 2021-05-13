//
//  Example.swift
//  
//
//  Created by Scott Tury on 5/12/21.
//

import Foundation

public class Example {

    public func dedupe(_ filtered: [Metadata]) -> [Metadata] {
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

    public func dedupe2(_ filtered: [Metadata]) -> [Metadata] {
        var deduped = [Metadata]()
        for metadata in filtered {
            if deduped.contains(where: { return $0.shortName == metadata.shortName }) == false {
                deduped.append(metadata)
             }
         }
         return deduped
    }
}
