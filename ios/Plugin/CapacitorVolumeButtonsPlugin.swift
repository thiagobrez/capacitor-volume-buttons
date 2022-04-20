import Foundation
import Capacitor
import MediaPlayer

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) {
            slider?.value = volume
        }
    }
}

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorVolumeButtonsPlugin)
public class CapacitorVolumeButtonsPlugin: CAPPlugin {
    private let implementation = CapacitorVolumeButtons()
    private var audioLevel: Float = 0.0

    override public func load() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(true, options: [])
            audioSession.addObserver(self, forKeyPath: "outputVolume",
                                     options: NSKeyValueObservingOptions.new, context: nil)
            audioLevel = audioSession.outputVolume
        } catch {
            print("Error loading CapacitorVolumeButtonsPlugin")
        }
    }

    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume" {
            let audioSession = AVAudioSession.sharedInstance()
            if audioSession.outputVolume > audioLevel {
                audioLevel = audioSession.outputVolume
                
                self.notifyListeners("volumeButtonPressed", data: [
                    "direction": "up"
                ])
            }
            if audioSession.outputVolume < audioLevel {
                audioLevel = audioSession.outputVolume
                
                self.notifyListeners("volumeButtonPressed", data: [
                    "direction": "down"
                ])
            }
            if audioSession.outputVolume > 0.999 {
                // Reached maximum, set back to a little below maximum so we can keep getting events for button up
                MPVolumeView.setVolume(0.9375)
                audioLevel = 0.9375
            }

            if audioSession.outputVolume < 0.001 {
                // Reached minimum, set back to a little above minimum so we can keep getting events for button down
                MPVolumeView.setVolume(0.0625)
                audioLevel = 0.0625
            }
        }
    }
    
}
