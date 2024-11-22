//
//  LyricsSourceIconDrawing.swift
//  LyricsX - https://github.com/ddddxxx/LyricsX
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

#if canImport(CoreGraphics)

#if canImport(Cocoa)
    
import Cocoa

typealias BezierPath = NSBezierPath
typealias Color = NSColor

extension BezierPath {
    
    var usesEvenOddFillRule: Bool {
        get {
            return windingRule == .evenOdd
        }
        set {
            windingRule = newValue ? .evenOdd : .nonZero
        }
    }
    
    func addLine(to point: NSPoint) {
        line(to: point)
    }
    
    func addCurve(to endPoint: NSPoint, controlPoint1: NSPoint, controlPoint2: NSPoint) {
        curve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    }
    
}
    
#elseif canImport(UIKit)
    
import UIKit

typealias BezierPath = UIBezierPath
typealias Color = UIColor
    
#endif

public class LyricsSourceIconDrawing {

    //// Cache

    private struct Cache {
        static let netEaseRed: Color = Color(red: 0.861, green: 0.000, blue: 0.100, alpha: 1.000)
        static let white: Color = Color(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        static let qqMusicYellow: Color = Color(red: 0.942, green: 0.765, blue: 0.165, alpha: 1.000)
        static let qqMusicGreen: Color = Color(red: 0.185, green: 0.661, blue: 0.383, alpha: 1.000)
        static let xiamiOrange: Color = Color(red: 0.963, green: 0.272, blue: 0.101, alpha: 1.000)
        static let kugouBlue: Color = Color(red: 0.108, green: 0.484, blue: 0.801, alpha: 1.000)
        static let gecimiRed: Color = Color(red: 0.805, green: 0.000, blue: 0.159, alpha: 1.000)
        static let gecimiGreen: Color = Color(red: 0.096, green: 0.515, blue: 0.094, alpha: 1.000)
        static let gecimiBlue: Color = Color(red: 0.081, green: 0.186, blue: 0.881, alpha: 1.000)
        static let gecimiYellow: Color = Color(red: 0.923, green: 0.529, blue: 0.121, alpha: 1.000)
    }

    //// Colors

    class var netEaseRed: Color { return Cache.netEaseRed }
    class var white: Color { return Cache.white }
    class var qqMusicYellow: Color { return Cache.qqMusicYellow }
    class var qqMusicGreen: Color { return Cache.qqMusicGreen }
    class var xiamiOrange: Color { return Cache.xiamiOrange }
    class var kugouBlue: Color { return Cache.kugouBlue }
    class var gecimiRed: Color { return Cache.gecimiRed }
    class var gecimiGreen: Color { return Cache.gecimiGreen }
    class var gecimiBlue: Color { return Cache.gecimiBlue }
    class var gecimiYellow: Color { return Cache.gecimiYellow }

    //// Drawing Methods

    class func drawNetEaseMusic(frame: CGRect = CGRect(x: 0, y: 0, width: 48, height: 48)) {

        //// bg Drawing
        let bgPath = BezierPath()
        bgPath.move(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.50000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77614 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.77614 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.22386 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77614 * frame.width, y: frame.minY + 0.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.50000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.22386 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.22386 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.77614 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.22386 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.close()
        bgPath.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.netEaseRed.setFill()
        bgPath.fill()


        //// shape Drawing
        let shapePath = BezierPath()
        shapePath.move(to: CGPoint(x: frame.minX + 0.60950 * frame.width, y: frame.minY + 0.14583 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.63144 * frame.width, y: frame.minY + 0.14939 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61681 * frame.width, y: frame.minY + 0.14700 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62420 * frame.width, y: frame.minY + 0.14783 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.69967 * frame.width, y: frame.minY + 0.18203 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65684 * frame.width, y: frame.minY + 0.15487 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.67959 * frame.width, y: frame.minY + 0.16589 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.71441 * frame.width, y: frame.minY + 0.22276 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.71285 * frame.width, y: frame.minY + 0.19261 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.71822 * frame.width, y: frame.minY + 0.20641 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.68656 * frame.width, y: frame.minY + 0.25160 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.71098 * frame.width, y: frame.minY + 0.23746 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.70138 * frame.width, y: frame.minY + 0.24737 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.64837 * frame.width, y: frame.minY + 0.24354 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67253 * frame.width, y: frame.minY + 0.25560 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.65988 * frame.width, y: frame.minY + 0.25256 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.59818 * frame.width, y: frame.minY + 0.22586 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63377 * frame.width, y: frame.minY + 0.23209 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61758 * frame.width, y: frame.minY + 0.22418 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.56744 * frame.width, y: frame.minY + 0.25935 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58174 * frame.width, y: frame.minY + 0.22730 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.56602 * frame.width, y: frame.minY + 0.24423 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.57229 * frame.width, y: frame.minY + 0.27938 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56806 * frame.width, y: frame.minY + 0.26612 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57054 * frame.width, y: frame.minY + 0.27272 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.58174 * frame.width, y: frame.minY + 0.31460 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57539 * frame.width, y: frame.minY + 0.29113 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57859 * frame.width, y: frame.minY + 0.30285 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.58569 * frame.width, y: frame.minY + 0.31839 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58228 * frame.width, y: frame.minY + 0.31662 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58280 * frame.width, y: frame.minY + 0.31822 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.70519 * frame.width, y: frame.minY + 0.36091 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62988 * frame.width, y: frame.minY + 0.32074 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66970 * frame.width, y: frame.minY + 0.33482 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.78778 * frame.width, y: frame.minY + 0.45606 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.74008 * frame.width, y: frame.minY + 0.38657 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76863 * frame.width, y: frame.minY + 0.41737 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.81178 * frame.width, y: frame.minY + 0.54592 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.80183 * frame.width, y: frame.minY + 0.48446 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.80970 * frame.width, y: frame.minY + 0.51445 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.79290 * frame.width, y: frame.minY + 0.66730 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.81455 * frame.width, y: frame.minY + 0.58775 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.80953 * frame.width, y: frame.minY + 0.62867 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.59060 * frame.width, y: frame.minY + 0.84162 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.75423 * frame.width, y: frame.minY + 0.75710 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68623 * frame.width, y: frame.minY + 0.81501 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.47920 * frame.width, y: frame.minY + 0.85362 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55422 * frame.width, y: frame.minY + 0.85177 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51694 * frame.width, y: frame.minY + 0.85572 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.27555 * frame.width, y: frame.minY + 0.76778 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40075 * frame.width, y: frame.minY + 0.84925 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33279 * frame.width, y: frame.minY + 0.82024 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.17160 * frame.width, y: frame.minY + 0.57776 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.21906 * frame.width, y: frame.minY + 0.71605 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.18384 * frame.width, y: frame.minY + 0.65243 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.24812 * frame.width, y: frame.minY + 0.30612 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.15493 * frame.width, y: frame.minY + 0.47617 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.18049 * frame.width, y: frame.minY + 0.38511 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.38566 * frame.width, y: frame.minY + 0.21128 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28525 * frame.width, y: frame.minY + 0.26272 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33161 * frame.width, y: frame.minY + 0.23146 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.43489 * frame.width, y: frame.minY + 0.22672 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40429 * frame.width, y: frame.minY + 0.20431 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42467 * frame.width, y: frame.minY + 0.21081 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.42842 * frame.width, y: frame.minY + 0.27684 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44534 * frame.width, y: frame.minY + 0.24298 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.44288 * frame.width, y: frame.minY + 0.26391 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.41401 * frame.width, y: frame.minY + 0.28546 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42434 * frame.width, y: frame.minY + 0.28051 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41917 * frame.width, y: frame.minY + 0.28340 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.25555 * frame.width, y: frame.minY + 0.46097 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.33161 * frame.width, y: frame.minY + 0.31839 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.27718 * frame.width, y: frame.minY + 0.37638 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.30667 * frame.width, y: frame.minY + 0.68432 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.23457 * frame.width, y: frame.minY + 0.54302 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.25311 * frame.width, y: frame.minY + 0.61814 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.43612 * frame.width, y: frame.minY + 0.76734 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34025 * frame.width, y: frame.minY + 0.72580 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.38362 * frame.width, y: frame.minY + 0.75366 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.53888 * frame.width, y: frame.minY + 0.77153 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47005 * frame.width, y: frame.minY + 0.77619 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50433 * frame.width, y: frame.minY + 0.77676 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.63771 * frame.width, y: frame.minY + 0.73465 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57454 * frame.width, y: frame.minY + 0.76614 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60784 * frame.width, y: frame.minY + 0.75466 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.72272 * frame.width, y: frame.minY + 0.62365 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67880 * frame.width, y: frame.minY + 0.70710 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.70808 * frame.width, y: frame.minY + 0.67038 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.72018 * frame.width, y: frame.minY + 0.50256 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.73535 * frame.width, y: frame.minY + 0.58332 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.73579 * frame.width, y: frame.minY + 0.54258 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.65750 * frame.width, y: frame.minY + 0.42511 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.70760 * frame.width, y: frame.minY + 0.47034 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68537 * frame.width, y: frame.minY + 0.44556 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.60840 * frame.width, y: frame.minY + 0.40148 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64262 * frame.width, y: frame.minY + 0.41418 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62664 * frame.width, y: frame.minY + 0.40566 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.60522 * frame.width, y: frame.minY + 0.40096 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60757 * frame.width, y: frame.minY + 0.40129 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60672 * frame.width, y: frame.minY + 0.40118 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.61242 * frame.width, y: frame.minY + 0.42801 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60771 * frame.width, y: frame.minY + 0.41028 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61002 * frame.width, y: frame.minY + 0.41916 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.62980 * frame.width, y: frame.minY + 0.49200 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61821 * frame.width, y: frame.minY + 0.44933 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62412 * frame.width, y: frame.minY + 0.47063 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.59754 * frame.width, y: frame.minY + 0.61376 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64214 * frame.width, y: frame.minY + 0.53844 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63019 * frame.width, y: frame.minY + 0.57911 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.48474 * frame.width, y: frame.minY + 0.65560 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56731 * frame.width, y: frame.minY + 0.64583 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52885 * frame.width, y: frame.minY + 0.65978 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.37767 * frame.width, y: frame.minY + 0.58259 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.43562 * frame.width, y: frame.minY + 0.65093 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40055 * frame.width, y: frame.minY + 0.62484 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.35956 * frame.width, y: frame.minY + 0.51168 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36568 * frame.width, y: frame.minY + 0.56047 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36052 * frame.width, y: frame.minY + 0.53663 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.39076 * frame.width, y: frame.minY + 0.40248 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35804 * frame.width, y: frame.minY + 0.47195 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36751 * frame.width, y: frame.minY + 0.43527 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.49119 * frame.width, y: frame.minY + 0.33063 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.41574 * frame.width, y: frame.minY + 0.36726 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45031 * frame.width, y: frame.minY + 0.34467 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.50143 * frame.width, y: frame.minY + 0.32730 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49440 * frame.width, y: frame.minY + 0.32953 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49767 * frame.width, y: frame.minY + 0.32853 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.49496 * frame.width, y: frame.minY + 0.30310 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49923 * frame.width, y: frame.minY + 0.31911 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49694 * frame.width, y: frame.minY + 0.31114 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.48736 * frame.width, y: frame.minY + 0.26976 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49223 * frame.width, y: frame.minY + 0.29202 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48874 * frame.width, y: frame.minY + 0.28101 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.51723 * frame.width, y: frame.minY + 0.18332 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48333 * frame.width, y: frame.minY + 0.23648 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49375 * frame.width, y: frame.minY + 0.20756 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.58771 * frame.width, y: frame.minY + 0.14715 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53647 * frame.width, y: frame.minY + 0.16349 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55978 * frame.width, y: frame.minY + 0.15091 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.59693 * frame.width, y: frame.minY + 0.14583 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.59079 * frame.width, y: frame.minY + 0.14673 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.59385 * frame.width, y: frame.minY + 0.14627 * frame.height))
        shapePath.addLine(to: CGPoint(x: frame.minX + 0.60950 * frame.width, y: frame.minY + 0.14583 * frame.height))
        shapePath.close()
        shapePath.move(to: CGPoint(x: frame.minX + 0.52227 * frame.width, y: frame.minY + 0.40410 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.46149 * frame.width, y: frame.minY + 0.44225 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49806 * frame.width, y: frame.minY + 0.41164 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47716 * frame.width, y: frame.minY + 0.42313 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.44303 * frame.width, y: frame.minY + 0.52855 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44053 * frame.width, y: frame.minY + 0.46787 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43635 * frame.width, y: frame.minY + 0.49729 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.46886 * frame.width, y: frame.minY + 0.56839 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44650 * frame.width, y: frame.minY + 0.54479 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45462 * frame.width, y: frame.minY + 0.55868 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.52951 * frame.width, y: frame.minY + 0.56739 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48666 * frame.width, y: frame.minY + 0.58051 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51091 * frame.width, y: frame.minY + 0.57998 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.55145 * frame.width, y: frame.minY + 0.51235 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54854 * frame.width, y: frame.minY + 0.55447 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55701 * frame.width, y: frame.minY + 0.53367 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.53259 * frame.width, y: frame.minY + 0.44238 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54537 * frame.width, y: frame.minY + 0.48898 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53890 * frame.width, y: frame.minY + 0.46570 * frame.height))
        shapePath.addCurve(to: CGPoint(x: frame.minX + 0.52227 * frame.width, y: frame.minY + 0.40410 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52920 * frame.width, y: frame.minY + 0.42984 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52581 * frame.width, y: frame.minY + 0.41726 * frame.height))
        shapePath.close()
        shapePath.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.white.setFill()
        shapePath.fill()
    }

    class func drawQQMusic(frame: CGRect = CGRect(x: 0, y: 0, width: 48, height: 48)) {

        //// bg Drawing
        let bgPath = BezierPath()
        bgPath.move(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.50000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77614 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.77614 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.22386 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77614 * frame.width, y: frame.minY + 0.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.50000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.22386 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.22386 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.77614 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.22386 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.close()
        bgPath.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.qqMusicYellow.setFill()
        bgPath.fill()


        //// note Drawing
        let notePath = BezierPath()
        notePath.move(to: CGPoint(x: frame.minX + 0.31250 * frame.width, y: frame.minY + 0.72893 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.31554 * frame.width, y: frame.minY + 0.71098 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.31350 * frame.width, y: frame.minY + 0.72295 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.31442 * frame.width, y: frame.minY + 0.71694 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.35160 * frame.width, y: frame.minY + 0.63909 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.32069 * frame.width, y: frame.minY + 0.68376 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33325 * frame.width, y: frame.minY + 0.65997 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.46637 * frame.width, y: frame.minY + 0.57531 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38198 * frame.width, y: frame.minY + 0.60453 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42092 * frame.width, y: frame.minY + 0.58403 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.55769 * frame.width, y: frame.minY + 0.57922 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49698 * frame.width, y: frame.minY + 0.56944 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52758 * frame.width, y: frame.minY + 0.57046 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.56340 * frame.width, y: frame.minY + 0.58049 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55925 * frame.width, y: frame.minY + 0.57966 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.56085 * frame.width, y: frame.minY + 0.57993 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.54281 * frame.width, y: frame.minY + 0.55210 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55615 * frame.width, y: frame.minY + 0.57050 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54950 * frame.width, y: frame.minY + 0.56130 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.35356 * frame.width, y: frame.minY + 0.29140 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47975 * frame.width, y: frame.minY + 0.46519 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41667 * frame.width, y: frame.minY + 0.37829 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.34948 * frame.width, y: frame.minY + 0.27127 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34906 * frame.width, y: frame.minY + 0.28522 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34744 * frame.width, y: frame.minY + 0.27895 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.38273 * frame.width, y: frame.minY + 0.22641 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35460 * frame.width, y: frame.minY + 0.25200 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36698 * frame.width, y: frame.minY + 0.23797 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.46654 * frame.width, y: frame.minY + 0.18970 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40779 * frame.width, y: frame.minY + 0.20808 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43648 * frame.width, y: frame.minY + 0.19717 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.51777 * frame.width, y: frame.minY + 0.17943 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48342 * frame.width, y: frame.minY + 0.18551 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50085 * frame.width, y: frame.minY + 0.18349 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.56027 * frame.width, y: frame.minY + 0.16653 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53217 * frame.width, y: frame.minY + 0.17598 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54650 * frame.width, y: frame.minY + 0.17184 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.61827 * frame.width, y: frame.minY + 0.12510 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58288 * frame.width, y: frame.minY + 0.15779 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60350 * frame.width, y: frame.minY + 0.14590 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.62523 * frame.width, y: frame.minY + 0.16043 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62067 * frame.width, y: frame.minY + 0.13686 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62367 * frame.width, y: frame.minY + 0.14856 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.62625 * frame.width, y: frame.minY + 0.18945 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62650 * frame.width, y: frame.minY + 0.17000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62679 * frame.width, y: frame.minY + 0.17981 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.57623 * frame.width, y: frame.minY + 0.28514 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62402 * frame.width, y: frame.minY + 0.22839 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60798 * frame.width, y: frame.minY + 0.26064 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.50396 * frame.width, y: frame.minY + 0.31240 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55498 * frame.width, y: frame.minY + 0.30152 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53033 * frame.width, y: frame.minY + 0.30930 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.45608 * frame.width, y: frame.minY + 0.31603 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48821 * frame.width, y: frame.minY + 0.31426 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47231 * frame.width, y: frame.minY + 0.31484 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.45727 * frame.width, y: frame.minY + 0.31890 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.45631 * frame.width, y: frame.minY + 0.31661 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45665 * frame.width, y: frame.minY + 0.31784 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.54854 * frame.width, y: frame.minY + 0.47585 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48767 * frame.width, y: frame.minY + 0.37121 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51810 * frame.width, y: frame.minY + 0.42354 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.63825 * frame.width, y: frame.minY + 0.63003 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57846 * frame.width, y: frame.minY + 0.52724 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60837 * frame.width, y: frame.minY + 0.57862 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.65663 * frame.width, y: frame.minY + 0.66294 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64458 * frame.width, y: frame.minY + 0.64090 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.65185 * frame.width, y: frame.minY + 0.65145 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.65433 * frame.width, y: frame.minY + 0.76590 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.67098 * frame.width, y: frame.minY + 0.69739 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66944 * frame.width, y: frame.minY + 0.73205 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.54923 * frame.width, y: frame.minY + 0.86130 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.63358 * frame.width, y: frame.minY + 0.81240 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.59690 * frame.width, y: frame.minY + 0.84275 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.46283 * frame.width, y: frame.minY + 0.87462 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52152 * frame.width, y: frame.minY + 0.87208 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49254 * frame.width, y: frame.minY + 0.87670 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.34640 * frame.width, y: frame.minY + 0.82183 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.41729 * frame.width, y: frame.minY + 0.87145 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37731 * frame.width, y: frame.minY + 0.85572 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.31250 * frame.width, y: frame.minY + 0.72893 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.32281 * frame.width, y: frame.minY + 0.79598 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.31250 * frame.width, y: frame.minY + 0.76273 * frame.height))
        notePath.addCurve(to: CGPoint(x: frame.minX + 0.31250 * frame.width, y: frame.minY + 0.72893 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.31350 * frame.width, y: frame.minY + 0.72295 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.31250 * frame.width, y: frame.minY + 0.73340 * frame.height))
        notePath.close()
        notePath.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.qqMusicGreen.setFill()
        notePath.fill()
    }

    class func drawXiami(frame: CGRect = CGRect(x: 0, y: 0, width: 48, height: 48)) {

        //// bg Drawing
        let bgPath = BezierPath()
        bgPath.move(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.20842 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.20842 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.09331 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.09318 * frame.width, y: frame.minY + 0.00000 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 0.79158 * frame.width, y: frame.minY + 0.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.20842 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.90669 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.09318 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.79158 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.79158 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.90669 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.90682 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 0.20842 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.79158 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.09331 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.90682 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.20842 * frame.height))
        bgPath.close()
        bgPath.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.xiamiOrange.setFill()
        bgPath.fill()


        //// xia Drawing
        let xiaPath = BezierPath()
        xiaPath.move(to: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.31250 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.13544 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.32342 * frame.width, y: frame.minY + 0.12061 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.11242 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.30590 * frame.width, y: frame.minY + 0.10580 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.42708 * frame.width, y: frame.minY + 0.20833 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.40625 * frame.width, y: frame.minY + 0.23958 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.33333 * frame.width, y: frame.minY + 0.18750 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.33333 * frame.width, y: frame.minY + 0.31250 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.39566 * frame.width, y: frame.minY + 0.31250 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.43750 * frame.width, y: frame.minY + 0.35417 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.41877 * frame.width, y: frame.minY + 0.31250 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43750 * frame.width, y: frame.minY + 0.33104 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.43750 * frame.width, y: frame.minY + 0.62500 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.39566 * frame.width, y: frame.minY + 0.66667 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.43750 * frame.width, y: frame.minY + 0.64801 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41871 * frame.width, y: frame.minY + 0.66667 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.33333 * frame.width, y: frame.minY + 0.66667 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.33333 * frame.width, y: frame.minY + 0.81250 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.40625 * frame.width, y: frame.minY + 0.75000 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.42908 * frame.width, y: frame.minY + 0.78847 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.32319 * frame.width, y: frame.minY + 0.87923 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.86456 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.30578 * frame.width, y: frame.minY + 0.89415 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.88775 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.66667 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.22934 * frame.width, y: frame.minY + 0.66667 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.18750 * frame.width, y: frame.minY + 0.62500 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.20623 * frame.width, y: frame.minY + 0.66667 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.18750 * frame.width, y: frame.minY + 0.64812 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.18750 * frame.width, y: frame.minY + 0.35417 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.22934 * frame.width, y: frame.minY + 0.31250 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.18750 * frame.width, y: frame.minY + 0.33116 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.20629 * frame.width, y: frame.minY + 0.31250 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.31250 * frame.height))
        xiaPath.close()
        xiaPath.move(to: CGPoint(x: frame.minX + 0.22917 * frame.width, y: frame.minY + 0.37497 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.22917 * frame.width, y: frame.minY + 0.60420 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.24998 * frame.width, y: frame.minY + 0.62500 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.22917 * frame.width, y: frame.minY + 0.61568 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.23848 * frame.width, y: frame.minY + 0.62500 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.62500 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.29167 * frame.width, y: frame.minY + 0.35417 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.24998 * frame.width, y: frame.minY + 0.35417 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.22917 * frame.width, y: frame.minY + 0.37497 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.23839 * frame.width, y: frame.minY + 0.35417 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.22917 * frame.width, y: frame.minY + 0.36348 * frame.height))
        xiaPath.close()
        xiaPath.move(to: CGPoint(x: frame.minX + 0.33333 * frame.width, y: frame.minY + 0.35417 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.33333 * frame.width, y: frame.minY + 0.62500 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.37502 * frame.width, y: frame.minY + 0.62500 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.39583 * frame.width, y: frame.minY + 0.60420 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38661 * frame.width, y: frame.minY + 0.62500 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39583 * frame.width, y: frame.minY + 0.61569 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.39583 * frame.width, y: frame.minY + 0.37497 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.37502 * frame.width, y: frame.minY + 0.35417 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39583 * frame.width, y: frame.minY + 0.36349 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.38652 * frame.width, y: frame.minY + 0.35417 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.33333 * frame.width, y: frame.minY + 0.35417 * frame.height))
        xiaPath.close()
        xiaPath.move(to: CGPoint(x: frame.minX + 0.60417 * frame.width, y: frame.minY + 0.29167 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.60417 * frame.width, y: frame.minY + 0.82300 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.59365 * frame.width, y: frame.minY + 0.83333 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60417 * frame.width, y: frame.minY + 0.82865 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.59946 * frame.width, y: frame.minY + 0.83333 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.57301 * frame.width, y: frame.minY + 0.83333 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.56250 * frame.width, y: frame.minY + 0.82300 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56696 * frame.width, y: frame.minY + 0.83333 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.56250 * frame.width, y: frame.minY + 0.82871 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.56250 * frame.width, y: frame.minY + 0.29167 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.46870 * frame.width, y: frame.minY + 0.29167 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.45833 * frame.width, y: frame.minY + 0.28115 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46281 * frame.width, y: frame.minY + 0.29167 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45833 * frame.width, y: frame.minY + 0.28696 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.45833 * frame.width, y: frame.minY + 0.26051 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.46873 * frame.width, y: frame.minY + 0.25000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.45833 * frame.width, y: frame.minY + 0.25446 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.46299 * frame.width, y: frame.minY + 0.25000 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.76044 * frame.width, y: frame.minY + 0.25000 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.77083 * frame.width, y: frame.minY + 0.26051 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76617 * frame.width, y: frame.minY + 0.25000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77083 * frame.width, y: frame.minY + 0.25471 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.77083 * frame.width, y: frame.minY + 0.28115 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.76041 * frame.width, y: frame.minY + 0.29167 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77083 * frame.width, y: frame.minY + 0.28721 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76617 * frame.width, y: frame.minY + 0.29167 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.60417 * frame.width, y: frame.minY + 0.29167 * frame.height))
        xiaPath.close()
        xiaPath.move(to: CGPoint(x: frame.minX + 0.71925 * frame.width, y: frame.minY + 0.61897 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.68750 * frame.width, y: frame.minY + 0.60433 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.70171 * frame.width, y: frame.minY + 0.63381 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68750 * frame.width, y: frame.minY + 0.62708 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.68750 * frame.width, y: frame.minY + 0.45817 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.71925 * frame.width, y: frame.minY + 0.44353 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68750 * frame.width, y: frame.minY + 0.43525 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.70174 * frame.width, y: frame.minY + 0.42871 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.79117 * frame.width, y: frame.minY + 0.50439 * frame.height))
        xiaPath.addCurve(to: CGPoint(x: frame.minX + 0.79117 * frame.width, y: frame.minY + 0.55811 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.80870 * frame.width, y: frame.minY + 0.51922 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.80868 * frame.width, y: frame.minY + 0.54330 * frame.height))
        xiaPath.addLine(to: CGPoint(x: frame.minX + 0.71925 * frame.width, y: frame.minY + 0.61897 * frame.height))
        xiaPath.close()
        xiaPath.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.white.setFill()
        xiaPath.fill()
    }

    class func drawKugou(frame: CGRect = CGRect(x: 0, y: 0, width: 48, height: 48)) {

        //// bg Drawing
        let bgPath = BezierPath(ovalIn: CGRect(x: frame.minX + floor(frame.width * 0.00000 + 0.5), y: frame.minY + floor(frame.height * 0.00000 + 0.5), width: floor(frame.width * 1.00000 + 0.5) - floor(frame.width * 0.00000 + 0.5), height: floor(frame.height * 1.00000 + 0.5) - floor(frame.height * 0.00000 + 0.5)))
        LyricsSourceIconDrawing.kugouBlue.setFill()
        bgPath.fill()


        //// inner Drawing
        let innerPath = BezierPath(ovalIn: CGRect(x: frame.minX + floor(frame.width * 0.10417 + 0.5), y: frame.minY + floor(frame.height * 0.10417 + 0.5), width: floor(frame.width * 0.89583 + 0.5) - floor(frame.width * 0.10417 + 0.5), height: floor(frame.height * 0.89583 + 0.5) - floor(frame.height * 0.10417 + 0.5)))
        LyricsSourceIconDrawing.white.setFill()
        innerPath.fill()


        //// k Drawing
        let kPath = BezierPath()
        kPath.move(to: CGPoint(x: frame.minX + 0.55877 * frame.width, y: frame.minY + 0.45274 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.75112 * frame.width, y: frame.minY + 0.27083 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.62235 * frame.width, y: frame.minY + 0.27083 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.48990 * frame.width, y: frame.minY + 0.39023 * frame.height))
        kPath.addCurve(to: CGPoint(x: frame.minX + 0.44286 * frame.width, y: frame.minY + 0.57306 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42031 * frame.width, y: frame.minY + 0.44978 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39633 * frame.width, y: frame.minY + 0.51647 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.57449 * frame.width, y: frame.minY + 0.72855 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.71826 * frame.width, y: frame.minY + 0.72855 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.55490 * frame.width, y: frame.minY + 0.54318 * frame.height))
        kPath.addCurve(to: CGPoint(x: frame.minX + 0.55877 * frame.width, y: frame.minY + 0.45274 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52622 * frame.width, y: frame.minY + 0.51055 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52418 * frame.width, y: frame.minY + 0.48547 * frame.height))
        kPath.close()
        kPath.move(to: CGPoint(x: frame.minX + 0.32857 * frame.width, y: frame.minY + 0.27155 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.28990 * frame.width, y: frame.minY + 0.72917 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.40020 * frame.width, y: frame.minY + 0.72917 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.41980 * frame.width, y: frame.minY + 0.49771 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.43898 * frame.width, y: frame.minY + 0.27155 * frame.height))
        kPath.addLine(to: CGPoint(x: frame.minX + 0.32857 * frame.width, y: frame.minY + 0.27155 * frame.height))
        kPath.close()
        LyricsSourceIconDrawing.kugouBlue.setFill()
        kPath.fill()
    }

    class func drawGecimi(frame: CGRect = CGRect(x: 0, y: 0, width: 48, height: 48)) {

        //// bg Drawing
        let bgPath = BezierPath()
        bgPath.move(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.20842 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.20842 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.09331 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.09318 * frame.width, y: frame.minY + 0.00000 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 0.79158 * frame.width, y: frame.minY + 0.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.20842 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.90669 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.09318 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.79158 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.79158 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.90669 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.90682 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 0.20842 * frame.width, y: frame.minY + 1.00000 * frame.height))
        bgPath.addCurve(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.79158 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.09331 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.90682 * frame.height))
        bgPath.addLine(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.20842 * frame.height))
        bgPath.close()
        bgPath.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.white.setFill()
        bgPath.fill()


        //// l6 Drawing
        let l6Path = BezierPath()
        l6Path.move(to: CGPoint(x: frame.minX + 0.90529 * frame.width, y: frame.minY + 0.40973 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.90109 * frame.width, y: frame.minY + 0.39944 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.90529 * frame.width, y: frame.minY + 0.40558 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.90389 * frame.width, y: frame.minY + 0.40215 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.89067 * frame.width, y: frame.minY + 0.39537 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.89830 * frame.width, y: frame.minY + 0.39673 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.89482 * frame.width, y: frame.minY + 0.39537 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.88024 * frame.width, y: frame.minY + 0.39944 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.88651 * frame.width, y: frame.minY + 0.39537 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.88304 * frame.width, y: frame.minY + 0.39673 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.87604 * frame.width, y: frame.minY + 0.40973 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.87744 * frame.width, y: frame.minY + 0.40215 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.87604 * frame.width, y: frame.minY + 0.40558 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.88038 * frame.width, y: frame.minY + 0.42002 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.87604 * frame.width, y: frame.minY + 0.41370 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.87749 * frame.width, y: frame.minY + 0.41713 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.89067 * frame.width, y: frame.minY + 0.42435 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.88326 * frame.width, y: frame.minY + 0.42291 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.88669 * frame.width, y: frame.minY + 0.42435 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.90109 * frame.width, y: frame.minY + 0.42016 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.89482 * frame.width, y: frame.minY + 0.42435 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.89830 * frame.width, y: frame.minY + 0.42295 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.90529 * frame.width, y: frame.minY + 0.40973 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.90389 * frame.width, y: frame.minY + 0.41736 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.90529 * frame.width, y: frame.minY + 0.41388 * frame.height))
        l6Path.close()
        l6Path.move(to: CGPoint(x: frame.minX + 0.92046 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.92046 * frame.width, y: frame.minY + 0.58063 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.91491 * frame.width, y: frame.minY + 0.57995 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.91865 * frame.width, y: frame.minY + 0.58026 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.91680 * frame.width, y: frame.minY + 0.58004 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.90963 * frame.width, y: frame.minY + 0.57927 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.91301 * frame.width, y: frame.minY + 0.57986 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.91125 * frame.width, y: frame.minY + 0.57963 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.90543 * frame.width, y: frame.minY + 0.57751 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.90800 * frame.width, y: frame.minY + 0.57891 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.90660 * frame.width, y: frame.minY + 0.57832 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.90313 * frame.width, y: frame.minY + 0.57358 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.90425 * frame.width, y: frame.minY + 0.57670 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.90349 * frame.width, y: frame.minY + 0.57539 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.90313 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.90150 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.86494 * frame.width, y: frame.minY + 0.46444 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.86494 * frame.width, y: frame.minY + 0.46606 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.87211 * frame.width, y: frame.minY + 0.46904 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.86747 * frame.width, y: frame.minY + 0.46697 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.86986 * frame.width, y: frame.minY + 0.46796 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.87794 * frame.width, y: frame.minY + 0.47229 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.87437 * frame.width, y: frame.minY + 0.47012 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.87631 * frame.width, y: frame.minY + 0.47121 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.88024 * frame.width, y: frame.minY + 0.47527 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.87920 * frame.width, y: frame.minY + 0.47319 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.87997 * frame.width, y: frame.minY + 0.47419 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.88065 * frame.width, y: frame.minY + 0.47906 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.88051 * frame.width, y: frame.minY + 0.47635 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.88065 * frame.width, y: frame.minY + 0.47762 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.88065 * frame.width, y: frame.minY + 0.57196 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.87889 * frame.width, y: frame.minY + 0.57602 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.88065 * frame.width, y: frame.minY + 0.57358 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.88006 * frame.width, y: frame.minY + 0.57494 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.87455 * frame.width, y: frame.minY + 0.57859 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.87771 * frame.width, y: frame.minY + 0.57710 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.87627 * frame.width, y: frame.minY + 0.57796 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.86873 * frame.width, y: frame.minY + 0.57995 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.87284 * frame.width, y: frame.minY + 0.57923 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.87090 * frame.width, y: frame.minY + 0.57968 * frame.height))
        l6Path.addCurve(to: CGPoint(x: frame.minX + 0.86223 * frame.width, y: frame.minY + 0.58063 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.86656 * frame.width, y: frame.minY + 0.58022 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.86440 * frame.width, y: frame.minY + 0.58044 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.86223 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l6Path.addLine(to: CGPoint(x: frame.minX + 0.92046 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l6Path.close()
        l6Path.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.gecimiRed.setFill()
        l6Path.fill()


        //// l5 Drawing
        let l5Path = BezierPath()
        l5Path.move(to: CGPoint(x: frame.minX + 0.84896 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.84896 * frame.width, y: frame.minY + 0.58090 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.84381 * frame.width, y: frame.minY + 0.58022 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.84733 * frame.width, y: frame.minY + 0.58072 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.84562 * frame.width, y: frame.minY + 0.58049 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.83880 * frame.width, y: frame.minY + 0.57914 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.84201 * frame.width, y: frame.minY + 0.57995 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.84034 * frame.width, y: frame.minY + 0.57959 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.83487 * frame.width, y: frame.minY + 0.57710 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.83727 * frame.width, y: frame.minY + 0.57868 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.83596 * frame.width, y: frame.minY + 0.57801 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.83325 * frame.width, y: frame.minY + 0.57385 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.83379 * frame.width, y: frame.minY + 0.57620 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.83325 * frame.width, y: frame.minY + 0.57512 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.83325 * frame.width, y: frame.minY + 0.49315 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.82526 * frame.width, y: frame.minY + 0.46390 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.83325 * frame.width, y: frame.minY + 0.48123 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.83059 * frame.width, y: frame.minY + 0.47148 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.80156 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.81993 * frame.width, y: frame.minY + 0.45631 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.81203 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.78734 * frame.width, y: frame.minY + 0.45550 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.79669 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.79195 * frame.width, y: frame.minY + 0.45351 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.77475 * frame.width, y: frame.minY + 0.46322 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.78274 * frame.width, y: frame.minY + 0.45749 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77854 * frame.width, y: frame.minY + 0.46006 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.76473 * frame.width, y: frame.minY + 0.47351 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77096 * frame.width, y: frame.minY + 0.46638 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76762 * frame.width, y: frame.minY + 0.46981 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.75796 * frame.width, y: frame.minY + 0.48394 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76184 * frame.width, y: frame.minY + 0.47721 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.75958 * frame.width, y: frame.minY + 0.48069 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.75715 * frame.width, y: frame.minY + 0.48394 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.74726 * frame.width, y: frame.minY + 0.46105 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.75588 * frame.width, y: frame.minY + 0.47437 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.75259 * frame.width, y: frame.minY + 0.46674 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.72627 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.74193 * frame.width, y: frame.minY + 0.45536 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.73494 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.71232 * frame.width, y: frame.minY + 0.45536 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.72140 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.71675 * frame.width, y: frame.minY + 0.45347 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.70000 * frame.width, y: frame.minY + 0.46241 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.70790 * frame.width, y: frame.minY + 0.45726 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.70379 * frame.width, y: frame.minY + 0.45961 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.68998 * frame.width, y: frame.minY + 0.47189 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.69621 * frame.width, y: frame.minY + 0.46520 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.69287 * frame.width, y: frame.minY + 0.46836 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.68294 * frame.width, y: frame.minY + 0.48204 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68709 * frame.width, y: frame.minY + 0.47541 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68474 * frame.width, y: frame.minY + 0.47879 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.68240 * frame.width, y: frame.minY + 0.48177 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.68240 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.68077 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.64529 * frame.width, y: frame.minY + 0.46525 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.64529 * frame.width, y: frame.minY + 0.46742 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.65179 * frame.width, y: frame.minY + 0.47053 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.64746 * frame.width, y: frame.minY + 0.46832 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.64963 * frame.width, y: frame.minY + 0.46936 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.65748 * frame.width, y: frame.minY + 0.47365 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65396 * frame.width, y: frame.minY + 0.47170 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.65585 * frame.width, y: frame.minY + 0.47274 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.65978 * frame.width, y: frame.minY + 0.47608 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65874 * frame.width, y: frame.minY + 0.47455 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.65951 * frame.width, y: frame.minY + 0.47536 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.66019 * frame.width, y: frame.minY + 0.47933 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.66005 * frame.width, y: frame.minY + 0.47681 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.66019 * frame.width, y: frame.minY + 0.47789 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.66019 * frame.width, y: frame.minY + 0.57196 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.65572 * frame.width, y: frame.minY + 0.57819 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.66019 * frame.width, y: frame.minY + 0.57485 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.65870 * frame.width, y: frame.minY + 0.57692 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.64502 * frame.width, y: frame.minY + 0.58063 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65274 * frame.width, y: frame.minY + 0.57945 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.64917 * frame.width, y: frame.minY + 0.58026 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.64502 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.69756 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.69756 * frame.width, y: frame.minY + 0.58063 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.69242 * frame.width, y: frame.minY + 0.57995 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.69576 * frame.width, y: frame.minY + 0.58026 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.69404 * frame.width, y: frame.minY + 0.58004 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.68795 * frame.width, y: frame.minY + 0.57927 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.69079 * frame.width, y: frame.minY + 0.57986 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68930 * frame.width, y: frame.minY + 0.57963 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.68456 * frame.width, y: frame.minY + 0.57751 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68659 * frame.width, y: frame.minY + 0.57891 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68547 * frame.width, y: frame.minY + 0.57832 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.68267 * frame.width, y: frame.minY + 0.57358 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68366 * frame.width, y: frame.minY + 0.57670 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68303 * frame.width, y: frame.minY + 0.57539 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.68267 * frame.width, y: frame.minY + 0.48475 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.69540 * frame.width, y: frame.minY + 0.47337 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68736 * frame.width, y: frame.minY + 0.47969 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.69160 * frame.width, y: frame.minY + 0.47590 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.71002 * frame.width, y: frame.minY + 0.46958 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.69919 * frame.width, y: frame.minY + 0.47085 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.70406 * frame.width, y: frame.minY + 0.46958 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.72966 * frame.width, y: frame.minY + 0.47866 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.71941 * frame.width, y: frame.minY + 0.46958 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.72595 * frame.width, y: frame.minY + 0.47261 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.73521 * frame.width, y: frame.minY + 0.50371 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.73336 * frame.width, y: frame.minY + 0.48470 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.73521 * frame.width, y: frame.minY + 0.49306 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.73521 * frame.width, y: frame.minY + 0.57304 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.73088 * frame.width, y: frame.minY + 0.57859 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.73521 * frame.width, y: frame.minY + 0.57593 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.73376 * frame.width, y: frame.minY + 0.57778 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.71923 * frame.width, y: frame.minY + 0.58035 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.72799 * frame.width, y: frame.minY + 0.57941 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.72410 * frame.width, y: frame.minY + 0.57999 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.71923 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.77258 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.77258 * frame.width, y: frame.minY + 0.58090 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.76757 * frame.width, y: frame.minY + 0.58022 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77096 * frame.width, y: frame.minY + 0.58072 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76929 * frame.width, y: frame.minY + 0.58049 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.76283 * frame.width, y: frame.minY + 0.57914 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76586 * frame.width, y: frame.minY + 0.57995 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76428 * frame.width, y: frame.minY + 0.57959 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.75931 * frame.width, y: frame.minY + 0.57710 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76139 * frame.width, y: frame.minY + 0.57868 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76022 * frame.width, y: frame.minY + 0.57801 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.75796 * frame.width, y: frame.minY + 0.57385 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.75841 * frame.width, y: frame.minY + 0.57620 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.75796 * frame.width, y: frame.minY + 0.57512 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.75796 * frame.width, y: frame.minY + 0.48638 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.77042 * frame.width, y: frame.minY + 0.47432 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.76229 * frame.width, y: frame.minY + 0.48150 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.76644 * frame.width, y: frame.minY + 0.47748 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.78531 * frame.width, y: frame.minY + 0.46958 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.77439 * frame.width, y: frame.minY + 0.47116 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.77935 * frame.width, y: frame.minY + 0.46958 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.80495 * frame.width, y: frame.minY + 0.47893 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.79470 * frame.width, y: frame.minY + 0.46958 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.80125 * frame.width, y: frame.minY + 0.47270 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.81050 * frame.width, y: frame.minY + 0.50398 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.80865 * frame.width, y: frame.minY + 0.48516 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.81050 * frame.width, y: frame.minY + 0.49351 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.81050 * frame.width, y: frame.minY + 0.57304 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.80671 * frame.width, y: frame.minY + 0.57859 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.81050 * frame.width, y: frame.minY + 0.57593 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.80924 * frame.width, y: frame.minY + 0.57778 * frame.height))
        l5Path.addCurve(to: CGPoint(x: frame.minX + 0.79560 * frame.width, y: frame.minY + 0.58035 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.80418 * frame.width, y: frame.minY + 0.57941 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.80048 * frame.width, y: frame.minY + 0.57999 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.79560 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l5Path.addLine(to: CGPoint(x: frame.minX + 0.84896 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l5Path.close()
        l5Path.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.gecimiGreen.setFill()
        l5Path.fill()


        //// l4 Drawing
        let l4Path = BezierPath()
        l4Path.move(to: CGPoint(x: frame.minX + 0.61117 * frame.width, y: frame.minY + 0.40973 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.60697 * frame.width, y: frame.minY + 0.42016 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61117 * frame.width, y: frame.minY + 0.41388 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60977 * frame.width, y: frame.minY + 0.41736 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.59654 * frame.width, y: frame.minY + 0.42435 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60417 * frame.width, y: frame.minY + 0.42295 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60069 * frame.width, y: frame.minY + 0.42435 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58625 * frame.width, y: frame.minY + 0.42002 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.59257 * frame.width, y: frame.minY + 0.42435 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58914 * frame.width, y: frame.minY + 0.42291 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58192 * frame.width, y: frame.minY + 0.40973 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58336 * frame.width, y: frame.minY + 0.41713 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58192 * frame.width, y: frame.minY + 0.41370 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58611 * frame.width, y: frame.minY + 0.39944 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58192 * frame.width, y: frame.minY + 0.40558 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58332 * frame.width, y: frame.minY + 0.40215 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.59654 * frame.width, y: frame.minY + 0.39537 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58891 * frame.width, y: frame.minY + 0.39673 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.59239 * frame.width, y: frame.minY + 0.39537 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.60697 * frame.width, y: frame.minY + 0.39944 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60069 * frame.width, y: frame.minY + 0.39537 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60417 * frame.width, y: frame.minY + 0.39673 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.61117 * frame.width, y: frame.minY + 0.40973 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60977 * frame.width, y: frame.minY + 0.40215 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61117 * frame.width, y: frame.minY + 0.40558 * frame.height))
        l4Path.close()
        l4Path.move(to: CGPoint(x: frame.minX + 0.62633 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.56810 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.56810 * frame.width, y: frame.minY + 0.58063 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.57460 * frame.width, y: frame.minY + 0.57995 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57027 * frame.width, y: frame.minY + 0.58044 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57244 * frame.width, y: frame.minY + 0.58022 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58043 * frame.width, y: frame.minY + 0.57859 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57677 * frame.width, y: frame.minY + 0.57968 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57871 * frame.width, y: frame.minY + 0.57923 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58476 * frame.width, y: frame.minY + 0.57602 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58214 * frame.width, y: frame.minY + 0.57796 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58359 * frame.width, y: frame.minY + 0.57710 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58652 * frame.width, y: frame.minY + 0.57196 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58593 * frame.width, y: frame.minY + 0.57494 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58652 * frame.width, y: frame.minY + 0.57358 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.58652 * frame.width, y: frame.minY + 0.47906 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58611 * frame.width, y: frame.minY + 0.47527 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58652 * frame.width, y: frame.minY + 0.47762 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58639 * frame.width, y: frame.minY + 0.47635 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.58381 * frame.width, y: frame.minY + 0.47229 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58584 * frame.width, y: frame.minY + 0.47419 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58508 * frame.width, y: frame.minY + 0.47319 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.57799 * frame.width, y: frame.minY + 0.46904 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58219 * frame.width, y: frame.minY + 0.47121 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58025 * frame.width, y: frame.minY + 0.47012 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.57081 * frame.width, y: frame.minY + 0.46606 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57573 * frame.width, y: frame.minY + 0.46796 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.57334 * frame.width, y: frame.minY + 0.46697 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.57081 * frame.width, y: frame.minY + 0.46444 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.60737 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.60900 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.60900 * frame.width, y: frame.minY + 0.57358 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.61130 * frame.width, y: frame.minY + 0.57751 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60936 * frame.width, y: frame.minY + 0.57539 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61013 * frame.width, y: frame.minY + 0.57670 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.61550 * frame.width, y: frame.minY + 0.57927 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61248 * frame.width, y: frame.minY + 0.57832 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61388 * frame.width, y: frame.minY + 0.57891 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.62078 * frame.width, y: frame.minY + 0.57995 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61713 * frame.width, y: frame.minY + 0.57963 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.61889 * frame.width, y: frame.minY + 0.57986 * frame.height))
        l4Path.addCurve(to: CGPoint(x: frame.minX + 0.62633 * frame.width, y: frame.minY + 0.58063 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62268 * frame.width, y: frame.minY + 0.58004 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62453 * frame.width, y: frame.minY + 0.58026 * frame.height))
        l4Path.addLine(to: CGPoint(x: frame.minX + 0.62633 * frame.width, y: frame.minY + 0.58333 * frame.height))
        l4Path.close()
        l4Path.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.gecimiBlue.setFill()
        l4Path.fill()


        //// l3 Drawing
        let l3Path = BezierPath()
        l3Path.move(to: CGPoint(x: frame.minX + 0.56052 * frame.width, y: frame.minY + 0.54460 * frame.height))
        l3Path.addLine(to: CGPoint(x: frame.minX + 0.55835 * frame.width, y: frame.minY + 0.54352 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.54210 * frame.width, y: frame.minY + 0.55991 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55402 * frame.width, y: frame.minY + 0.55074 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54860 * frame.width, y: frame.minY + 0.55620 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.51556 * frame.width, y: frame.minY + 0.56546 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53560 * frame.width, y: frame.minY + 0.56361 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52676 * frame.width, y: frame.minY + 0.56546 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.49647 * frame.width, y: frame.minY + 0.56153 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.50852 * frame.width, y: frame.minY + 0.56546 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50216 * frame.width, y: frame.minY + 0.56415 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.48198 * frame.width, y: frame.minY + 0.55043 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49078 * frame.width, y: frame.minY + 0.55891 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48595 * frame.width, y: frame.minY + 0.55521 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.47277 * frame.width, y: frame.minY + 0.53309 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47801 * frame.width, y: frame.minY + 0.54564 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47494 * frame.width, y: frame.minY + 0.53986 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.46952 * frame.width, y: frame.minY + 0.51075 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47060 * frame.width, y: frame.minY + 0.52632 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.46952 * frame.width, y: frame.minY + 0.51888 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.47250 * frame.width, y: frame.minY + 0.48990 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46952 * frame.width, y: frame.minY + 0.50335 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47051 * frame.width, y: frame.minY + 0.49640 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.48063 * frame.width, y: frame.minY + 0.47283 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47449 * frame.width, y: frame.minY + 0.48340 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47719 * frame.width, y: frame.minY + 0.47771 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.49281 * frame.width, y: frame.minY + 0.46119 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48406 * frame.width, y: frame.minY + 0.46796 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.48812 * frame.width, y: frame.minY + 0.46408 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.50825 * frame.width, y: frame.minY + 0.45685 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49751 * frame.width, y: frame.minY + 0.45830 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.50265 * frame.width, y: frame.minY + 0.45685 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.52491 * frame.width, y: frame.minY + 0.46349 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.51583 * frame.width, y: frame.minY + 0.45685 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52139 * frame.width, y: frame.minY + 0.45907 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.53019 * frame.width, y: frame.minY + 0.48015 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52843 * frame.width, y: frame.minY + 0.46791 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53019 * frame.width, y: frame.minY + 0.47347 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.52883 * frame.width, y: frame.minY + 0.48935 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53019 * frame.width, y: frame.minY + 0.48376 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52974 * frame.width, y: frame.minY + 0.48683 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.53357 * frame.width, y: frame.minY + 0.49613 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52956 * frame.width, y: frame.minY + 0.49206 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53114 * frame.width, y: frame.minY + 0.49432 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.54183 * frame.width, y: frame.minY + 0.49883 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53601 * frame.width, y: frame.minY + 0.49793 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53876 * frame.width, y: frame.minY + 0.49883 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.55172 * frame.width, y: frame.minY + 0.49464 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54563 * frame.width, y: frame.minY + 0.49883 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54892 * frame.width, y: frame.minY + 0.49743 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.55592 * frame.width, y: frame.minY + 0.48475 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55452 * frame.width, y: frame.minY + 0.49184 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55592 * frame.width, y: frame.minY + 0.48854 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.55172 * frame.width, y: frame.minY + 0.47094 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55592 * frame.width, y: frame.minY + 0.47951 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55452 * frame.width, y: frame.minY + 0.47491 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.54075 * frame.width, y: frame.minY + 0.46092 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54892 * frame.width, y: frame.minY + 0.46697 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54526 * frame.width, y: frame.minY + 0.46363 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.52531 * frame.width, y: frame.minY + 0.45469 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53624 * frame.width, y: frame.minY + 0.45821 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53109 * frame.width, y: frame.minY + 0.45613 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.50771 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.51953 * frame.width, y: frame.minY + 0.45324 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51367 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.48320 * frame.width, y: frame.minY + 0.45794 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.49886 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49069 * frame.width, y: frame.minY + 0.45433 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.46383 * frame.width, y: frame.minY + 0.47229 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.47570 * frame.width, y: frame.minY + 0.46155 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.46925 * frame.width, y: frame.minY + 0.46633 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.45110 * frame.width, y: frame.minY + 0.49301 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.45842 * frame.width, y: frame.minY + 0.47825 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45417 * frame.width, y: frame.minY + 0.48516 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.44650 * frame.width, y: frame.minY + 0.51779 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44803 * frame.width, y: frame.minY + 0.50086 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.44650 * frame.width, y: frame.minY + 0.50912 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.45097 * frame.width, y: frame.minY + 0.54379 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.44650 * frame.width, y: frame.minY + 0.52700 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.44799 * frame.width, y: frame.minY + 0.53567 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.46329 * frame.width, y: frame.minY + 0.56505 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.45395 * frame.width, y: frame.minY + 0.55192 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45806 * frame.width, y: frame.minY + 0.55900 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.48225 * frame.width, y: frame.minY + 0.57914 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46853 * frame.width, y: frame.minY + 0.57110 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47485 * frame.width, y: frame.minY + 0.57580 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.50635 * frame.width, y: frame.minY + 0.58415 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48965 * frame.width, y: frame.minY + 0.58248 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49769 * frame.width, y: frame.minY + 0.58415 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.52545 * frame.width, y: frame.minY + 0.58117 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.51322 * frame.width, y: frame.minY + 0.58415 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.51958 * frame.width, y: frame.minY + 0.58315 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.54129 * frame.width, y: frame.minY + 0.57264 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.53132 * frame.width, y: frame.minY + 0.57918 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.53660 * frame.width, y: frame.minY + 0.57634 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.55321 * frame.width, y: frame.minY + 0.55991 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54599 * frame.width, y: frame.minY + 0.56893 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54996 * frame.width, y: frame.minY + 0.56469 * frame.height))
        l3Path.addCurve(to: CGPoint(x: frame.minX + 0.56052 * frame.width, y: frame.minY + 0.54460 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55646 * frame.width, y: frame.minY + 0.55512 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55890 * frame.width, y: frame.minY + 0.55002 * frame.height))
        l3Path.close()
        l3Path.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.gecimiYellow.setFill()
        l3Path.fill()


        //// l2 Drawing
        let l2Path = BezierPath()
        l2Path.move(to: CGPoint(x: frame.minX + 0.43540 * frame.width, y: frame.minY + 0.54217 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.43052 * frame.width, y: frame.minY + 0.55557 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.43467 * frame.width, y: frame.minY + 0.54614 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43305 * frame.width, y: frame.minY + 0.55061 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.42023 * frame.width, y: frame.minY + 0.56925 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42799 * frame.width, y: frame.minY + 0.56054 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42456 * frame.width, y: frame.minY + 0.56510 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.40466 * frame.width, y: frame.minY + 0.57954 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.41590 * frame.width, y: frame.minY + 0.57340 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41071 * frame.width, y: frame.minY + 0.57683 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.38448 * frame.width, y: frame.minY + 0.58360 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39861 * frame.width, y: frame.minY + 0.58225 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39188 * frame.width, y: frame.minY + 0.58360 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.35929 * frame.width, y: frame.minY + 0.57846 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.37527 * frame.width, y: frame.minY + 0.58360 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36688 * frame.width, y: frame.minY + 0.58189 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.33993 * frame.width, y: frame.minY + 0.56397 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35171 * frame.width, y: frame.minY + 0.57503 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34525 * frame.width, y: frame.minY + 0.57020 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.32760 * frame.width, y: frame.minY + 0.54203 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.33460 * frame.width, y: frame.minY + 0.55774 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33049 * frame.width, y: frame.minY + 0.55043 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.32327 * frame.width, y: frame.minY + 0.51535 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.32472 * frame.width, y: frame.minY + 0.53364 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.32327 * frame.width, y: frame.minY + 0.52474 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.32733 * frame.width, y: frame.minY + 0.49274 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.32327 * frame.width, y: frame.minY + 0.50777 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.32462 * frame.width, y: frame.minY + 0.50023 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.33884 * frame.width, y: frame.minY + 0.47256 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.33004 * frame.width, y: frame.minY + 0.48525 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.33388 * frame.width, y: frame.minY + 0.47852 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.35699 * frame.width, y: frame.minY + 0.45807 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34381 * frame.width, y: frame.minY + 0.46660 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34986 * frame.width, y: frame.minY + 0.46177 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.38069 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36412 * frame.width, y: frame.minY + 0.45437 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37202 * frame.width, y: frame.minY + 0.45252 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.40059 * frame.width, y: frame.minY + 0.45523 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38773 * frame.width, y: frame.minY + 0.45252 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39436 * frame.width, y: frame.minY + 0.45342 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.41684 * frame.width, y: frame.minY + 0.46349 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40682 * frame.width, y: frame.minY + 0.45703 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41224 * frame.width, y: frame.minY + 0.45979 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.42808 * frame.width, y: frame.minY + 0.47744 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42145 * frame.width, y: frame.minY + 0.46719 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.42519 * frame.width, y: frame.minY + 0.47184 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.43323 * frame.width, y: frame.minY + 0.49721 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.43097 * frame.width, y: frame.minY + 0.48303 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43269 * frame.width, y: frame.minY + 0.48963 * frame.height))
        l2Path.addLine(to: CGPoint(x: frame.minX + 0.34629 * frame.width, y: frame.minY + 0.49721 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.34602 * frame.width, y: frame.minY + 0.50222 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34629 * frame.width, y: frame.minY + 0.49865 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34620 * frame.width, y: frame.minY + 0.50032 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.34575 * frame.width, y: frame.minY + 0.50804 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34584 * frame.width, y: frame.minY + 0.50411 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34575 * frame.width, y: frame.minY + 0.50606 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.34900 * frame.width, y: frame.minY + 0.52984 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34575 * frame.width, y: frame.minY + 0.51563 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34683 * frame.width, y: frame.minY + 0.52289 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.35848 * frame.width, y: frame.minY + 0.54826 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35117 * frame.width, y: frame.minY + 0.53680 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35433 * frame.width, y: frame.minY + 0.54293 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.37419 * frame.width, y: frame.minY + 0.56085 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36263 * frame.width, y: frame.minY + 0.55359 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36787 * frame.width, y: frame.minY + 0.55778 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.39613 * frame.width, y: frame.minY + 0.56546 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38051 * frame.width, y: frame.minY + 0.56392 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.38782 * frame.width, y: frame.minY + 0.56546 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.41982 * frame.width, y: frame.minY + 0.55855 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40515 * frame.width, y: frame.minY + 0.56546 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41305 * frame.width, y: frame.minY + 0.56316 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.43323 * frame.width, y: frame.minY + 0.54162 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42659 * frame.width, y: frame.minY + 0.55395 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43106 * frame.width, y: frame.minY + 0.54831 * frame.height))
        l2Path.addLine(to: CGPoint(x: frame.minX + 0.43540 * frame.width, y: frame.minY + 0.54217 * frame.height))
        l2Path.close()
        l2Path.move(to: CGPoint(x: frame.minX + 0.40642 * frame.width, y: frame.minY + 0.48150 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.39951 * frame.width, y: frame.minY + 0.46430 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40642 * frame.width, y: frame.minY + 0.47482 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40411 * frame.width, y: frame.minY + 0.46909 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.38096 * frame.width, y: frame.minY + 0.45713 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39491 * frame.width, y: frame.minY + 0.45952 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.38872 * frame.width, y: frame.minY + 0.45713 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.36728 * frame.width, y: frame.minY + 0.46159 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.37590 * frame.width, y: frame.minY + 0.45713 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37134 * frame.width, y: frame.minY + 0.45861 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.35672 * frame.width, y: frame.minY + 0.47202 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36322 * frame.width, y: frame.minY + 0.46457 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35970 * frame.width, y: frame.minY + 0.46805 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.34981 * frame.width, y: frame.minY + 0.48407 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.35374 * frame.width, y: frame.minY + 0.47599 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35144 * frame.width, y: frame.minY + 0.48001 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.34683 * frame.width, y: frame.minY + 0.49342 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.34819 * frame.width, y: frame.minY + 0.48814 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34719 * frame.width, y: frame.minY + 0.49125 * frame.height))
        l2Path.addLine(to: CGPoint(x: frame.minX + 0.35794 * frame.width, y: frame.minY + 0.49342 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.36755 * frame.width, y: frame.minY + 0.49328 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36119 * frame.width, y: frame.minY + 0.49342 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.36439 * frame.width, y: frame.minY + 0.49337 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.37744 * frame.width, y: frame.minY + 0.49301 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.37071 * frame.width, y: frame.minY + 0.49319 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37401 * frame.width, y: frame.minY + 0.49310 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.38881 * frame.width, y: frame.minY + 0.49288 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38087 * frame.width, y: frame.minY + 0.49292 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.38466 * frame.width, y: frame.minY + 0.49288 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.39640 * frame.width, y: frame.minY + 0.49260 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39152 * frame.width, y: frame.minY + 0.49288 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39405 * frame.width, y: frame.minY + 0.49278 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.40263 * frame.width, y: frame.minY + 0.49125 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.39874 * frame.width, y: frame.minY + 0.49242 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40082 * frame.width, y: frame.minY + 0.49197 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.40547 * frame.width, y: frame.minY + 0.48719 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40389 * frame.width, y: frame.minY + 0.48981 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40484 * frame.width, y: frame.minY + 0.48845 * frame.height))
        l2Path.addCurve(to: CGPoint(x: frame.minX + 0.40642 * frame.width, y: frame.minY + 0.48150 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40610 * frame.width, y: frame.minY + 0.48592 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40642 * frame.width, y: frame.minY + 0.48403 * frame.height))
        l2Path.close()
        l2Path.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.gecimiRed.setFill()
        l2Path.fill()


        //// l1 Drawing
        let l1Path = BezierPath()
        l1Path.move(to: CGPoint(x: frame.minX + 0.30377 * frame.width, y: frame.minY + 0.49315 * frame.height))
        l1Path.addLine(to: CGPoint(x: frame.minX + 0.30377 * frame.width, y: frame.minY + 0.49044 * frame.height))
        l1Path.addLine(to: CGPoint(x: frame.minX + 0.22442 * frame.width, y: frame.minY + 0.49044 * frame.height))
        l1Path.addLine(to: CGPoint(x: frame.minX + 0.22442 * frame.width, y: frame.minY + 0.49315 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.24635 * frame.width, y: frame.minY + 0.50154 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.23489 * frame.width, y: frame.minY + 0.49405 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.24220 * frame.width, y: frame.minY + 0.49685 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.25191 * frame.width, y: frame.minY + 0.51400 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.24942 * frame.width, y: frame.minY + 0.50479 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.25127 * frame.width, y: frame.minY + 0.50894 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.25285 * frame.width, y: frame.minY + 0.53106 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.25254 * frame.width, y: frame.minY + 0.51906 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.25285 * frame.width, y: frame.minY + 0.52474 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.25177 * frame.width, y: frame.minY + 0.54948 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.25285 * frame.width, y: frame.minY + 0.53738 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.25249 * frame.width, y: frame.minY + 0.54352 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.24852 * frame.width, y: frame.minY + 0.56194 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.25105 * frame.width, y: frame.minY + 0.55544 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.24997 * frame.width, y: frame.minY + 0.55959 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.23078 * frame.width, y: frame.minY + 0.57643 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.24419 * frame.width, y: frame.minY + 0.56862 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.23827 * frame.width, y: frame.minY + 0.57345 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.20654 * frame.width, y: frame.minY + 0.58090 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.22329 * frame.width, y: frame.minY + 0.57941 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.21521 * frame.width, y: frame.minY + 0.58090 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.17431 * frame.width, y: frame.minY + 0.57399 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.19444 * frame.width, y: frame.minY + 0.58090 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.18370 * frame.width, y: frame.minY + 0.57859 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.15048 * frame.width, y: frame.minY + 0.55463 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.16492 * frame.width, y: frame.minY + 0.56939 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.15698 * frame.width, y: frame.minY + 0.56293 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.13558 * frame.width, y: frame.minY + 0.52470 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.14398 * frame.width, y: frame.minY + 0.54632 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.13901 * frame.width, y: frame.minY + 0.53634 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.13044 * frame.width, y: frame.minY + 0.48610 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.13215 * frame.width, y: frame.minY + 0.51305 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.13044 * frame.width, y: frame.minY + 0.50019 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.13585 * frame.width, y: frame.minY + 0.44941 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.13044 * frame.width, y: frame.minY + 0.47328 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.13224 * frame.width, y: frame.minY + 0.46105 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.15129 * frame.width, y: frame.minY + 0.41853 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.13947 * frame.width, y: frame.minY + 0.43776 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.14461 * frame.width, y: frame.minY + 0.42747 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.17567 * frame.width, y: frame.minY + 0.39714 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.15797 * frame.width, y: frame.minY + 0.40959 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.16610 * frame.width, y: frame.minY + 0.40246 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.20790 * frame.width, y: frame.minY + 0.38915 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.18524 * frame.width, y: frame.minY + 0.39181 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.19598 * frame.width, y: frame.minY + 0.38915 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.23823 * frame.width, y: frame.minY + 0.39483 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.21909 * frame.width, y: frame.minY + 0.38915 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.22920 * frame.width, y: frame.minY + 0.39104 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.26044 * frame.width, y: frame.minY + 0.40973 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.24726 * frame.width, y: frame.minY + 0.39863 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.25466 * frame.width, y: frame.minY + 0.40359 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.27317 * frame.width, y: frame.minY + 0.42760 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.26495 * frame.width, y: frame.minY + 0.41442 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.26919 * frame.width, y: frame.minY + 0.42038 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.28210 * frame.width, y: frame.minY + 0.45062 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.27714 * frame.width, y: frame.minY + 0.43483 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.28012 * frame.width, y: frame.minY + 0.44250 * frame.height))
        l1Path.addLine(to: CGPoint(x: frame.minX + 0.28535 * frame.width, y: frame.minY + 0.45062 * frame.height))
        l1Path.addLine(to: CGPoint(x: frame.minX + 0.28535 * frame.width, y: frame.minY + 0.39158 * frame.height))
        l1Path.addLine(to: CGPoint(x: frame.minX + 0.28292 * frame.width, y: frame.minY + 0.39158 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.27696 * frame.width, y: frame.minY + 0.39944 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28057 * frame.width, y: frame.minY + 0.39465 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.27858 * frame.width, y: frame.minY + 0.39727 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.27398 * frame.width, y: frame.minY + 0.40269 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.27533 * frame.width, y: frame.minY + 0.40160 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.27434 * frame.width, y: frame.minY + 0.40269 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.26883 * frame.width, y: frame.minY + 0.39984 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.27362 * frame.width, y: frame.minY + 0.40269 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.27190 * frame.width, y: frame.minY + 0.40174 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.25570 * frame.width, y: frame.minY + 0.39361 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.26576 * frame.width, y: frame.minY + 0.39795 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.26139 * frame.width, y: frame.minY + 0.39587 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.23471 * frame.width, y: frame.minY + 0.38739 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.25001 * frame.width, y: frame.minY + 0.39136 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.24301 * frame.width, y: frame.minY + 0.38928 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.20600 * frame.width, y: frame.minY + 0.38454 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.22640 * frame.width, y: frame.minY + 0.38549 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.21683 * frame.width, y: frame.minY + 0.38454 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.15996 * frame.width, y: frame.minY + 0.39226 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.18794 * frame.width, y: frame.minY + 0.38454 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.17260 * frame.width, y: frame.minY + 0.38711 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.12800 * frame.width, y: frame.minY + 0.41271 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.14732 * frame.width, y: frame.minY + 0.39741 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.13667 * frame.width, y: frame.minY + 0.40422 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.11270 * frame.width, y: frame.minY + 0.43167 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.12186 * frame.width, y: frame.minY + 0.41867 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.11676 * frame.width, y: frame.minY + 0.42499 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.10322 * frame.width, y: frame.minY + 0.45144 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.10864 * frame.width, y: frame.minY + 0.43835 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.10548 * frame.width, y: frame.minY + 0.44494 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.09848 * frame.width, y: frame.minY + 0.46999 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.10096 * frame.width, y: frame.minY + 0.45794 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.09938 * frame.width, y: frame.minY + 0.46412 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.09712 * frame.width, y: frame.minY + 0.48556 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.09758 * frame.width, y: frame.minY + 0.47586 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.09712 * frame.width, y: frame.minY + 0.48105 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.10457 * frame.width, y: frame.minY + 0.52714 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.09712 * frame.width, y: frame.minY + 0.50091 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.09961 * frame.width, y: frame.minY + 0.51477 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.12597 * frame.width, y: frame.minY + 0.55855 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.10954 * frame.width, y: frame.minY + 0.53950 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.11667 * frame.width, y: frame.minY + 0.54998 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.16023 * frame.width, y: frame.minY + 0.57805 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.13527 * frame.width, y: frame.minY + 0.56713 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.14669 * frame.width, y: frame.minY + 0.57363 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.20627 * frame.width, y: frame.minY + 0.58469 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.17377 * frame.width, y: frame.minY + 0.58248 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.18912 * frame.width, y: frame.minY + 0.58469 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.23227 * frame.width, y: frame.minY + 0.58198 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.21494 * frame.width, y: frame.minY + 0.58469 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.22360 * frame.width, y: frame.minY + 0.58378 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.25597 * frame.width, y: frame.minY + 0.57534 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.24094 * frame.width, y: frame.minY + 0.58017 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.24884 * frame.width, y: frame.minY + 0.57796 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.27411 * frame.width, y: frame.minY + 0.56762 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.26310 * frame.width, y: frame.minY + 0.57273 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.26915 * frame.width, y: frame.minY + 0.57015 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.28346 * frame.width, y: frame.minY + 0.56221 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.27908 * frame.width, y: frame.minY + 0.56510 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.28219 * frame.width, y: frame.minY + 0.56329 * frame.height))
        l1Path.addLine(to: CGPoint(x: frame.minX + 0.28346 * frame.width, y: frame.minY + 0.52267 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.28373 * frame.width, y: frame.minY + 0.51021 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28346 * frame.width, y: frame.minY + 0.51851 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.28355 * frame.width, y: frame.minY + 0.51436 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.28590 * frame.width, y: frame.minY + 0.50100 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28391 * frame.width, y: frame.minY + 0.50606 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.28463 * frame.width, y: frame.minY + 0.50299 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.29375 * frame.width, y: frame.minY + 0.49545 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28752 * frame.width, y: frame.minY + 0.49847 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.29014 * frame.width, y: frame.minY + 0.49662 * frame.height))
        l1Path.addCurve(to: CGPoint(x: frame.minX + 0.30377 * frame.width, y: frame.minY + 0.49315 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.29736 * frame.width, y: frame.minY + 0.49427 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.30070 * frame.width, y: frame.minY + 0.49351 * frame.height))
        l1Path.close()
        l1Path.usesEvenOddFillRule = true;

        LyricsSourceIconDrawing.gecimiBlue.setFill()
        l1Path.fill()
    }

}

#endif
