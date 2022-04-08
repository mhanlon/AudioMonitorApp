import SwiftUI

struct ContentView: View {
    let audioMonitor = AudioMonitor()
    
    @State var volume: Double = 0.0
    @State var isMonitoring = false
    
    var body: some View {
        VStack {
            Image(systemName: "waveform.circle")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .padding()
            MeterView(volume: volume, stepByValue: 0.1)
            MeterView(volume: volume)
                .padding()
            Text("Let's hear you clap!")
            HStack {
                if !self.isMonitoring {
                    Button {
                        self.audioMonitor.start()
                        self.audioMonitor.setOnUpdateHandler { tone in
                            self.volume = tone.volume
                        }
                        self.isMonitoring.toggle()
                    } label: {
                        Text("Monitor")
                    }
                } else {
                    Button {
                        self.audioMonitor.stop()
                        self.isMonitoring.toggle()
                    } label: {
                        Text("Stop Monitoring")
                    }
                }
            }
            .padding()
        }
    }
}
