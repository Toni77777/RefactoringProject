
import Foundation
import UIKit

protocol Scene {
    var viewController: UIViewController { get }
}

struct SimpleScene: Scene {
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
