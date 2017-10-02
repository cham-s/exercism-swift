//Solution goes in Sources

import Foundation

typealias Second = Int
typealias Year = Double

enum Planet: Year {
    case earth = 365.25
    case mercury = 0.2408467
    case venus = 0.61519726
    case mars = 1.8808158
    case jupiter = 11.862615
    case saturn = 29.447498
    case uranus = 84.016846
    case neptune = 164.79132
}

struct SpaceAge {
    let seconds: Second
    var onEarth: Year { return convert(ageInseconds: seconds, planet: .earth) }
    var onMercury: Year { return convert(ageInseconds: seconds, planet: .mercury) }
    var onVenus: Year { return convert(ageInseconds: seconds, planet: .venus) }
    var onMars: Year { return convert(ageInseconds: seconds, planet: .mars) }
    var onJupiter: Year { return convert(ageInseconds: seconds, planet: .jupiter) }
    var onSaturn: Year { return convert(ageInseconds: seconds, planet: .saturn) }
    var onUranus: Year { return convert(ageInseconds: seconds, planet: .uranus) }
    var onNeptune: Year {  return convert(ageInseconds: seconds, planet: .neptune) }
    
    init(_ seconds: Second) {
        self.seconds = seconds
    }
    
    private func convert(ageInseconds: Second, planet: Planet) -> Year {
        let day = 60 * 60 * 24
        var result = Double(ageInseconds) / Double(day)
        var earthDaysPerYear: Year
        switch planet {
        case .earth:
            earthDaysPerYear = planet.rawValue
        default:
            earthDaysPerYear = planet.rawValue * Planet.earth.rawValue
        }
        var value = result.roundToTheNearest(100) / Double(earthDaysPerYear)
        return value.roundToTheNearest(100)
    }
    
}

extension Double {
    mutating func roundToTheNearest(_ decimal: Double) -> Double {
        return Darwin.round(self * decimal) / decimal
    }
}
