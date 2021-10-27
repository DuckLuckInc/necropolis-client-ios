import UIKit
import PinLayout
import WebKit

class AuthViewController: UIViewController {
	
	var controller: AuthConroller?
	
	lazy var webView: WKWebView = {
		let webConfiguration = WKWebViewConfiguration()
		let webView = WKWebView(frame: .zero, configuration: webConfiguration)
		webView.scrollView.contentInsetAdjustmentBehavior = .never
		webView.navigationDelegate = self
		webView.uiDelegate = self
		return webView
	}()
	
	lazy var backButton: UIButton = {
		let button = UIButton()
		button.imageView?.contentMode = .scaleAspectFit
		button.contentHorizontalAlignment = .fill
		button.contentVerticalAlignment = .fill
		//button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
		button.tintColor = UIColor(red: 58/255, green: 112/255, blue: 192/255, alpha: 1)
//		button.setTitleColor(.blue, for: .normal)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
        view.backgroundColor = .white
		view.addSubview(webView)
		view.addSubview(backButton)
		startWebView()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layoutBackButton()
		layoutWebView()
	}
	
	func layoutBackButton() {
		backButton.pin
			.left(10)
			.top(5%)
			.height(20)
			.width(20)
	}
	
	func layoutWebView() {
		webView.pin
			.left()
			.right()
			.top(to: backButton.edge.bottom).marginTop(10)
			.bottom()
	}
	
	private func startWebView() {
		let myURL = URL(string:"https://oauth.vk.com/authorize?client_id=7986189&display=page&redirect_uri=http://localhost:8080/api/v1/user/oauth/vk&response_type=code&scope=offline")
		let myRequest = URLRequest(url: myURL!)
		webView.load(myRequest)
	}
	
	func showMainScreen() {
		let viewController = ViewController()
		navigationController?.pushViewController(viewController, animated: true)
	}
	
	
}

extension AuthViewController: WKUIDelegate, WKNavigationDelegate {
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		webView.evaluateJavaScript("document.firstChild.textContent") { [weak self] responseData, _ in
			self?.controller?.validateTokens(rawJsonString: responseData as? String)
		}
	}
	
}
