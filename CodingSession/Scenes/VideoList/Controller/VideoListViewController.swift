//
//  ViewController.swift
//  CodingSession
//
//  Created by Pavel Ilin on 01.11.2023.
//

import UIKit
import RxSwift
import SnapKit

final class VideoListViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var collectionDataSource = VideosCollectionSource()
    private let viewModel: VideoListViewModelProtocol
    private let bag = DisposeBag()
    
    // MARK: - Init
    
    init(viewModel: VideoListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    
    deinit {
        debugPrint("[VideoListViewController] deinit")
    }
    
    // MARK: - Override
    
    override func setupUI() {
        super.setupUI()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        collectionDataSource.register(collectionView)
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        let output = viewModel.transform(.init(
            viewWillAppear: rx.viewWillAppear.asDriver().mapToVoid()
        ))
        bag.insert(
            output.items.drive(collectionDataSource.rx.items)
        )
    }
}
