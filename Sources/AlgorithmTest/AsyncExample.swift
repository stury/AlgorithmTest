//
//  File.swift
//  
//
//  Created by Scott Tury on 5/11/21.
//

import Foundation

class AsyncExample : Example, ExampleProtocol {

    func process(_ iterations: Int) -> (TimeInterval, TimeInterval) {
        let async = Async(label: "example" )

        var interval1: TimeInterval = 0.0
        var interval2: TimeInterval = 0.0

        async.async(DispatchWorkItem {
            async.enter()
            let metadata = generateMetaData( iterations )
            interval1 = measureTime {
                _ = self.dedupe(metadata)
            }
            async.leave()
        })
        async.async(DispatchWorkItem {
            async.enter()
            let metadata = generateMetaData( iterations )
            interval2 = measureTime {
                _ = self.dedupe2(metadata)
            }
            async.leave()
        })
        
        // Give a bit of time for the async process to start!
        sleep(10)
        
        // Now wait for them to finish.
        async.waitForGroupToFinish()
        
        return ( interval1, interval2 )
    }

}
