import SwiftUI

public enum Pretendard {
    case w100, w200, w300, w400, w500, w600, w700, w800, w900
}

public extension Font {
    static func pretendard(size: CGFloat, weight: Pretendard = .w400) -> Font {
        var font: PieceFontConvertible
        
        switch weight {
        case .w100:
            font = PieceFontFamily.Pretendard.thin
        case .w200:
            font = PieceFontFamily.Pretendard.extraLight
        case .w300:
            font = PieceFontFamily.Pretendard.light
        case .w400:
            font = PieceFontFamily.Pretendard.regular
        case .w500:
            font = PieceFontFamily.Pretendard.medium
        case .w600:
            font = PieceFontFamily.Pretendard.semiBold
        case .w700:
            font = PieceFontFamily.Pretendard.bold
        case .w800:
            font = PieceFontFamily.Pretendard.extraBold
        case .w900:
            font = PieceFontFamily.Pretendard.black
        }
        
        return font.swiftUIFont(size: size)
    }
}
