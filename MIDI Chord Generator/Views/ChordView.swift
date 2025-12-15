import SwiftUI

struct ChordView: View {

    @State private var chords: [Chord] = []
    private let chordRules = ChordRules()

    var body: some View {
        VStack(spacing: 20) {
            Text("MIDI Chord Generator")
                .font(.largeTitle)
                .bold()
                .padding()

            Button("Generate C Major Triads") {
                let triadNotes = chordRules.triads(rootNote: 60) // Middle C
                chords = triadNotes.enumerated().map { index, notes in
                    Chord(name: "Chord \(index + 1)", notes: notes)
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            List(chords) { chord in
                VStack(alignment: .leading) {
                    Text(chord.name)
                        .font(.headline)
                    Text(MIDIParser.notesToString(chord.notes))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct ChordView_Previews: PreviewProvider {
    static var previews: some View {
        ChordView()
    }
}
