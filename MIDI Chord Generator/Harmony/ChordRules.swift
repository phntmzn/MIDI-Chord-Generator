import Foundation

/// ChordRules
/// Provides rules for generating chords based on key and scale
struct ChordRules {

    private let majorScale: [Int] = [0, 2, 4, 5, 7, 9, 11] // Intervals for a major scale

    /// Generate triad chords from a given root note
    func triads(rootNote: Int) -> [[Int]] {
        var chords: [[Int]] = []
        for degree in majorScale {
            let chord = [rootNote + degree,
                         rootNote + (degree + 4) % 12,
                         rootNote + (degree + 7) % 12]
            chords.append(chord)
        }
        return chords
    }

    /// Generate seventh chords from a given root note
    func seventhChords(rootNote: Int) -> [[Int]] {
        var chords: [[Int]] = []
        for degree in majorScale {
            let chord = [rootNote + degree,
                         rootNote + (degree + 4) % 12,
                         rootNote + (degree + 7) % 12,
                         rootNote + (degree + 11) % 12]
            chords.append(chord)
        }
        return chords
    }

    /// Generate chord name based on root note and type
    func chordName(rootNote: Int, type: String) -> String {
        let noteNames = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
        let root = noteNames[rootNote % 12]
        return "\(root) \(type)"
    }
}

// Example usage
let rules = ChordRules()
let triads = rules.triads(rootNote: 60) // Middle C triads
let sevenths = rules.seventhChords(rootNote: 60) // Middle C seventh chords
print("Triads: \(triads)")
print("Sevenths: \(sevenths)")
print(rules.chordName(rootNote: 60, type: "maj"))
