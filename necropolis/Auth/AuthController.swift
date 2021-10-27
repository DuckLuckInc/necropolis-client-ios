import Foundation

struct Tokens: Codable {
	let accessToken: String
	let refreshToken: String
}

class AuthConroller {
	
	weak var viewController: AuthViewController?
	
	func validateTokens(rawJsonString: String?) {
		guard let jsonString = rawJsonString,
			  let data = jsonString.data(using: .utf8),
			  let tokens = try? JSONDecoder().decode(Tokens.self, from: data)
		else { return }
		debugPrint(tokens)
		viewController?.showMainScreen()
	}
}
