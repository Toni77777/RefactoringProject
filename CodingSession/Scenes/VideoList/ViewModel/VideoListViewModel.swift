
import Foundation
import RxSwift
import RxCocoa
import Photos

final class VideoListViewModel {
    
    // MARK: - Properties
    
    private let dependencies: Dependencies
    private let router: VideoListRouterInput
    
    struct Dependencies {
        let mediaLibraryService: MediaLibraryServiceProtocol
    }
    
    // MARK: - Init
    
    init(
        dependencies: Dependencies,
        router: VideoListRouterInput
    ) {
        self.dependencies = dependencies
        self.router = router
    }
}

// MARK: - VideoListViewModelProtocol

extension VideoListViewModel: VideoListViewModelProtocol {
    
    func transform(_ input: VideoListInput) -> VideoListOutput {
        
        let videoAssets = input.viewWillAppear
            .flatMap { [dependencies] in
                dependencies.mediaLibraryService.requestAuthorization().asDriverOnErrorJustComplete()
            }
            .filter { $0 }
            .flatMap { [dependencies] _ in
                dependencies.mediaLibraryService.fetchVideoAssets().asDriverOnErrorJustComplete()
            }
            
        return VideoListOutput(items: videoAssets)
    }
}
