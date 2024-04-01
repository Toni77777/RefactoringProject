
import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver(onErrorRecover: {
            debugPrint($0)
            return .empty()
        })
    }
}
