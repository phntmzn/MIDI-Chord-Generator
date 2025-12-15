# MIDI Chord Generator

A Swift-based application that generates musical chords using MIDI input and predefined harmony rules.

---

## Features

- Generate triads and seventh chords from any root note
- Real-time MIDI input handling using CoreMIDI
- SwiftUI interface for displaying generated chords
- Utilities for formatting and displaying MIDI notes and chords

---

## Project Structure

```
MIDI Chord Generator/
├── MIDI/
│   └── MIDIManager.swift       # Handles MIDI input
├── Harmony/
│   └── ChordRules.swift        # Chord generation logic and rules
├── Views/
│   └── ChordView.swift         # SwiftUI view for generating and displaying chords
├── Models/
│   └── Chord.swift             # Represents musical chords
└── Utilities/
    └── MIDIParser.swift        # Formatting utilities for MIDI data and chords
```

---

## Usage

### 1. Initialize MIDI Manager
```swift
let midiManager = MIDIManager()
midiManager.onNoteReceived = { note, velocity, channel in
    print("Received note: \(note), velocity: \(velocity), channel: \(channel)")
}
```

### 2. Generate Chords Using ChordRules
```swift
let chordRules = ChordRules()
let triads = chordRules.triads(rootNote: 60) // Middle C
let sevenths = chordRules.seventhChords(rootNote: 60)
```

### 3. Display Chords in SwiftUI
```swift
ChordView() // Shows generated chords in a list
```

### 4. Format Chords and Notes
```swift
let cMajor = Chord(name: "C Major", notes: [60, 64, 67])
print(MIDIParser.chordToString(cMajor))
```

---

## Roadmap

- Add support for more complex chord types (sus2, sus4, extended chords)
- Visualize chords on a keyboard or fretboard
- Integration with CoreML for chord suggestion and prediction

---

## License

MIT License

Generate musical chords from MIDI input and explore harmonic structures with Swift.
