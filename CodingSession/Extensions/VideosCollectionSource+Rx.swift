
import Foundation
import RxCocoa
import RxSwift
import Photos

extension Reactive where Base: VideosCollectionSource {
        
    var items: Binder<[PHAsset]> {
        return Binder(base) { source, assets in
            source.assets = assets
        }
    }
}
