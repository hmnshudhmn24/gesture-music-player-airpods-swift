# 🎵 Gesture-Based Music Player for AirPods Pro

Control your music using AirPods Pro gestures and accelerometer movement. This Swift-based app allows you to skip, pause, or play tracks by simply moving your head or double-tapping your AirPods. It’s your next-gen hands-free music control experience.

## 🧠 Project Description

This music player detects head gestures using CoreMotion and simulates gesture detection for AirPods Pro. For demonstration, gesture-based navigation is linked with track changes. Use simulated acceleration patterns to control playback.

## 🧰 Tech Stack

- Swift
- CoreMotion
- AVFoundation
- CoreBluetooth (placeholder for future AirPods gesture recognition)
- SwiftUI

## 🚀 Features

- Play/Pause music with UI buttons
- Simulated gesture control using device motion
- Simulate AirPods double-tap or long-press via accelerometer
- CoreMotion gesture detection
- Future integration ready for AirPods Pro Bluetooth gesture capture

## 🧑‍💻 How to Run

1. **Requirements:**
   - Xcode 14 or later
   - iOS 15 or later
   - A real device for motion gesture detection

2. **Steps:**
   - Clone the repo:
     ```bash
     git clone https://github.com/yourusername/gesture-music-player-airpods-swift.git
     ```
   - Open the project in Xcode.
   - Add sample music files (`sample1.mp3` and `sample2.mp3`) to your project bundle.
   - Build and run the app on a real iPhone (simulators won’t support motion gestures).

3. **Usage:**
   - Tap Play to start music.
   - Perform a sharp motion (like a shake or tilt) to trigger gestures.
   - Use Start/Stop Gesture Detection buttons to activate or stop motion tracking.

---

## 📄 License

MIT License
