struct Strings {
    
    struct Login {
        static let appName = "Login"
        static let usernameLabel = "Email"
        static let passwordLabel = "Password"
        static let usernamePlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let loginButton = "LOGIN WITH EMAIL"
        static let loginButton1 = "LOGIN AS GUEST*"
        static let loginButton2 = "F"
        static let loginButton3 = "G"
        static let loginButton4 = "(a)"
        static let emailValidateError = "Please enter email"
        static let passwordValidateError = "Please enter password"
    }
    
    struct Common {
        static let okay = "Okay"
    }
}

typealias LoginStrings = Strings.Login
typealias CommonStrings = Strings.Common
