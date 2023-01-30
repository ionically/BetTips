struct Strings {
    
    struct Login {
        static let appName = "Smart Bet Tips"
        static let usernameLabel = "Username"
        static let passwordLabel = "Password"
        static let usernamePlaceholder = "Enter Username"
        static let passwordPlaceholder = "Enter Password"
        static let loginButton = "Login"
        static let emailValidateError = "Please enter email"
        static let passwordValidateError = "Please enter password"
    }
    
    struct Common {
        static let okay = "Okay"
    }
}

typealias LoginStrings = Strings.Login
typealias CommonStrings = Strings.Common
