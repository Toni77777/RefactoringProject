
import Foundation
import UIKit
import Photos

protocol ImageProviderable {
    func loadImage(asset: PHAsset, size: CGSize, completion: @escaping (_ image: UIImage?) -> Void) 
    func cancel()
}
