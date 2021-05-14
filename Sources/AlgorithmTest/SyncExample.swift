//
//  File.swift
//  
//
//  Created by Scott Tury on 5/11/21.
//

import Foundation

struct SyncExample: ExampleProtocol {
 
    func process(_ iterations: Int) -> (TimeInterval, TimeInterval) {
        let metadata = generateMetaData(iterations)

        return ( measureTime { _ = dedupe(metadata)  }, measureTime { _ = dedupe2(metadata) })
    }

}
