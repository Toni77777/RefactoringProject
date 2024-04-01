
import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    // MARK: - Setup
    
    func setupUI() {
    }
    
    func bindViewModel() {
    }
}
