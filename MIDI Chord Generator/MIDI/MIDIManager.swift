

import Foundation
import CoreMIDI

/// MIDIManager
/// Handles MIDI input for the MIDI Chord Generator project
final class MIDIManager {

    private var midiClient = MIDIClientRef()
    private var inputPort = MIDIPortRef()
    var onNoteReceived: ((UInt8, UInt8, UInt8) -> Void)? // note, velocity, channel

    init(clientName: String = "MIDIChordGenClient") {
        MIDIClientCreate(clientName as CFString, nil, nil, &midiClient)
        MIDIInputPortCreate(midiClient, "InputPort" as CFString, midiReadCallback, Unmanaged.passUnretained(self).toOpaque(), &inputPort)

        let sourceCount = MIDIGetNumberOfSources()
        for i in 0..<sourceCount {
            let src = MIDIGetSource(i)
            MIDIPortConnectSource(inputPort, src, nil)
        }
    }

    deinit {
        MIDIPortDispose(inputPort)
        MIDIClientDispose(midiClient)
    }

    private let midiReadCallback: MIDIReadProc = { packetList, refCon, _ in
        guard let refCon else { return }
        let manager = Unmanaged<MIDIManager>.fromOpaque(refCon).takeUnretainedValue()

        var packet = packetList.pointee.packet
        for _ in 0..<packetList.pointee.numPackets {
            let status = packet.data.0 & 0xF0
            let channel = packet.data.0 & 0x0F
            let note = packet.data.1
            let velocity = packet.data.2

            if status == 0x90 && velocity > 0 { // Note On
                manager.onNoteReceived?(note, velocity, channel)
            } else if status == 0x80 || (status == 0x90 && velocity == 0) { // Note Off
                manager.onNoteReceived?(note, 0, channel)
            }

            packet = MIDIPacketNext(&packet).pointee
        }
    }
}