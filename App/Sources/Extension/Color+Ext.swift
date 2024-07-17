import SwiftUI

public extension Color {
    struct Gray { }
    struct Blue { }
    struct Red { }
}

public extension Color.Blue {
    static let blue500: Color = PieceAsset.Blue.blue500.swiftUIColor
    static let blue600: Color = PieceAsset.Blue.blue600.swiftUIColor
    static let blue700: Color = PieceAsset.Blue.blue700.swiftUIColor
}

public extension Color.Gray {
    
    static let gray100: Color = PieceAsset.Gray.gray100.swiftUIColor
    
    static let gray300: Color = PieceAsset.Gray.gray300.swiftUIColor
    
    static let gray400: Color = PieceAsset.Gray.gray400.swiftUIColor
    
    static let gray500: Color = PieceAsset.Gray.gray500.swiftUIColor
    
}

public extension Color.Red {
    static let red500: Color = PieceAsset.Red.red500.swiftUIColor
}
