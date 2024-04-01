
import Foundation
import RxSwift
import RxCocoa
import Photos

protocol VideoListViewModelProtocol {
    func transform(_ input: VideoListInput) -> VideoListOutput
}

struct VideoListInput {
    let viewWillAppear: Driver<Void>
}

struct VideoListOutput {
    let items: Driver<[PHAsset]>
}
