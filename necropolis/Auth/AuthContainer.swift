import Foundation
import UIKit

final class AuthContainer {
	static func assemble() -> UIViewController {
		let authVC = AuthViewController()
		let authC = AuthConroller()
		authVC.controller = authC
		authC.viewController = authVC
		return authVC.wrappedIntoNavigation()
	}
}

extension UIViewController {
	func wrappedIntoNavigation() -> UIViewController {
		let navi = UINavigationController(rootViewController: self)
		navi.isNavigationBarHidden = true
		return navi
	}
}
