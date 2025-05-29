import SwiftUI
import CoreMotion
import AVFoundation
import CoreBluetooth

class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    @Published var gestureDetected = ""

    func startUpdates() {
        guard motionManager.isAccelerometerAvailable else { return }
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: .main) { data, error in
            guard let data = data else { return }
            if data.acceleration.x > 1.0 {
                self.gestureDetected = "Next Track"
                MusicPlayer.shared.nextTrack()
            } else if data.acceleration.y > 1.0 {
                self.gestureDetected = "Previous Track"
                MusicPlayer.shared.previousTrack()
            }
        }
    }

    func stopUpdates() {
        motionManager.stopAccelerometerUpdates()
    }
}

class MusicPlayer {
    static let shared = MusicPlayer()
    var player: AVAudioPlayer?

    func playMusic(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Error loading music: \(error.localizedDescription)")
        }
    }

    func pauseMusic() {
        player?.pause()
    }

    func resumeMusic() {
        player?.play()
    }

    func nextTrack() {
        // Simulate next track
        playMusic(named: "sample2")
    }

    func previousTrack() {
        // Simulate previous track
        playMusic(named: "sample1")
    }
}

struct ContentView: View {
    @StateObject private var motionManager = MotionManager()
    @State private var isPlaying = false

    var body: some View {
        VStack(spacing: 30) {
            Text("🎧 Gesture-Based Music Player")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            Text("Detected: \(motionManager.gestureDetected)")
                .font(.title2)
                .foregroundColor(.blue)

            HStack {
                Button(action: {
                    MusicPlayer.shared.playMusic(named: "sample1")
                    isPlaying = true
                }) {
                    Text("▶️ Play")
                }

                Button(action: {
                    MusicPlayer.shared.pauseMusic()
                    isPlaying = false
                }) {
                    Text("⏸ Pause")
                }
            }

            Button("Start Gesture Detection") {
                motionManager.startUpdates()
            }

            Button("Stop Gesture Detection") {
                motionManager.stopUpdates()
            }

            Spacer()
        }
        .padding()
    }
}

@main
struct GestureMusicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
