//
//  File.swift
//  
//
//  Created by Scott Tury on 5/11/21.
//

import Foundation

protocol ExampleProtocol {    
    func process(_ iterations: Int) -> (TimeInterval, TimeInterval)
}

extension ExampleProtocol {
    
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
