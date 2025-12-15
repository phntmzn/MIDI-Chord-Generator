import Foundation

/// Chord
/// Represents a musical chord with a name and MIDI note numbers
struct Chord: Identifiable {
    let id = UUID()
    var name: String
    var notes: [Int]  // MIDI note numbers

    init(name: String, notes: [Int]) {
        self.name = name
        self.notes = notes
    }
}

// Example usage
let cMajor = Chord(name: "C Major", notes: [60, 64, 67])
print("Chord: \(cMajor.name), Notes: \(cMajor.notes)")
