
import Foundation
import UIKit

protocol ReusableView: AnyObject {}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableView {}

extension UICollectionView {

    func registerCell<T: UICollectionViewCell>(ofType cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(ofType cellType: T.Type, forIndexPath indexPath: IndexPath) -> T {
        let reuseIdentifier = cellType.defaultReuseIdentifier
        guard
            let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T
            else { fatalError("Cannot instantiate cell with \"\(reuseIdentifier)\" reuse identifier") }
        return cell
    }
}
