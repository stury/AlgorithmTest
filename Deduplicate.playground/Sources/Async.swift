import Foundation

public class Async {

    private let queue : DispatchQueue
    private let group = DispatchGroup()

    public init(label: String) {
        queue = DispatchQueue(label: "com.tury.concurrent.\(label)", qos: .userInitiated, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    }

    public func createWorkItem( closure: @escaping(()->Void) ) -> DispatchWorkItem {
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
    
    public func async( _ workItem: DispatchWorkItem ) {
        queue.async(execute: workItem)
    }
    
    public func waitForGroupToFinish() {
        group.wait()
    }
}
