
import Foundation
import Photos
import RxSwift
import RxCocoa

protocol MediaLibraryServiceProtocol {
    func requestAuthorization() -> Observable<Bool>
    func fetchVideoAssets() -> Observable<[PHAsset]>
}

final class MediaLibraryService: MediaLibraryServiceProtocol {
    
    func requestAuthorization() -> Observable<Bool> {
        Observable.create { observer in
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                let grand = status == .authorized || status == .limited
                observer.onNext(grand)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    func fetchVideoAssets() -> Observable<[PHAsset]> {
        Observable.create { observer in
            let fetchOptions = PHFetchOptions()
            fetchOptions.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.video.rawValue)
            let fetchResult = PHAsset.fetchAssets(with: fetchOptions)
            var videoAssets: [PHAsset] = []
            fetchResult.enumerateObjects { (asset, _, _) in
                videoAssets.append(asset)
            }
            observer.onNext(videoAssets)
            observer.onCompleted()
            return Disposables.create()
        }
    }
}
