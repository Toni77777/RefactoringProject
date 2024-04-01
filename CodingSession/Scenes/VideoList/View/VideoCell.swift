
import Foundation
import UIKit
import Photos

final class VideoCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var asset: PHAsset? {
        didSet {
            guard let asset = asset else { return }
            imageLoader.loadImage(asset: asset, size: Constants.previewSize) { [weak self] image in
                self?.thumbImageView.image = image
            }
            durationLabel.text = VideoCell.formatter.string(from: asset.duration)
        }
    }
    
    private enum Constants {
        static let previewSize = CGSize(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)  // Размер изображения. Вы можете установить другой размер, если нужно меньшее разрешение для превью.
    }
    
    private static let formatter = DateComponentsFormatter().with {
        $0.allowedUnits = [.hour, .minute, .second]
        $0.zeroFormattingBehavior = [.pad]
        $0.unitsStyle = .positional
    }
    
    private let thumbImageView = UIImageView().with {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let durationLabel = UILabel()
    private var imageLoader = PHAssetImageLoader()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(thumbImageView)
        thumbImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.addSubview(durationLabel)
        durationLabel.snp.makeConstraints {
            $0.leading.equalTo(8)
            $0.bottom.equalTo(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbImageView.image = nil
        durationLabel.text = nil
        imageLoader.cancel()
    }
}
