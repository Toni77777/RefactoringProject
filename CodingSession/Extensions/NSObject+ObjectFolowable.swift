
import Foundation

protocol ObjectFolowable {
}

extension ObjectFolowable {
    
    @discardableResult
    func with(_ transformer: (Self) -> Void) -> Self {
        transformer(self)
        return self
    }
}

extension NSObject: ObjectFolowable {
}
