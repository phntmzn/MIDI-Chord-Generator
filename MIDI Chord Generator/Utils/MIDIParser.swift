import Foundation

/// MIDIParser
/// Helper functions for parsing and formatting MIDI notes and chords
struct MIDIParser {

    /// Converts an array of MIDI note numbers to a readable string
    static func notesToString(_ notes: [Int]) -> String {
        notes.map { String($0) }.joined(separator: ", ")
    }

    /// Converts a Chord object to a human-readable string
    static func chordToString(_ chord: Chord) -> String {
        "\(chord.name): \(notesToString(chord.notes))"
    }

    /// Converts an array of Chord objects to a summary string
    static func chordsToSummary(_ chords: [Chord]) -> String {
        chords.map { chordToString($0) }.joined(separator: "\n")
    }
}

// Example usage
let cMajor = Chord(name: "C Major", notes: [60, 64, 67])
let gMajor = Chord(name: "G Major", notes: [67, 71, 74])
print(MIDIParser.chordToString(cMajor))
print(MIDIParser.chordsToSummary([cMajor, gMajor]))
