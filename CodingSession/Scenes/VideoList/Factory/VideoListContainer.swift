
import Foundation

final class VideoListContainer {
}

// MARK: - VideoListFactory

extension VideoListContainer: VideoListFactory {
    
    func assemble() -> Scene {
        let router = VideoListRouter()
        let viewModel = VideoListViewModel(
            dependencies: .init(mediaLibraryService: MediaLibraryService()),
            router: router
        )
        let controller = VideoListViewController(viewModel: viewModel)
        router.controller = controller
        return SimpleScene(viewController: controller)
    }
}
