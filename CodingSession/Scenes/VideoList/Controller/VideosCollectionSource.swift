
import UIKit
import Photos

final class VideosCollectionSource: NSObject {
    
    // MARK: - Properties
    
    var assets: [PHAsset] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private var collectionView: UICollectionView?
    
    private enum Constants {
        static let cellSize: CGSize = .init(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
    }
    
    // MARK: - Public
    
    func register(_ collectionView: UICollectionView) {
        collectionView.registerCell(ofType: VideoCell.self)
        
        self.collectionView = collectionView
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension VideosCollectionSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: VideoCell.self, forIndexPath: indexPath)
        cell.asset = assets[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension VideosCollectionSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        Constants.cellSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
