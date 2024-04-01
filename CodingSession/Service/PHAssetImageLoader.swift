
import Foundation
import UIKit
import Photos

final class PHAssetImageLoader {
    private var requestId: PHImageRequestID?
}

// MARK: - ImageProviderable

extension PHAssetImageLoader: ImageProviderable {
    
    func loadImage(asset: PHAsset, size: CGSize, completion: @escaping (_ image: UIImage?) -> Void) {
        let manager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = false
        requestOptions.deliveryMode = .highQualityFormat
        manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: requestOptions) { image, _ in
            completion(image)
        }
    }
    
    func cancel() {
        guard let requestId = requestId else { return }
        PHImageManager.default().cancelImageRequest(requestId)
    }
}
