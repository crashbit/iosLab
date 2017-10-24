import UIKit
import AVFoundation
import PlaygroundSupport

class reproductor:NSObject, AVAudioPlayerDelegate {
    var play = false
    var player = AVAudioPlayer()
    
    func reproduce(audio:String) {
        guard let path = Bundle.main.path(forResource: audio, ofType: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:path))
            player.delegate = self
            player.play()
            play = true
        } catch {
            fatalError("Error en la reproducción")
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        play = false
        print("Se acabó la reproducción")
        player.delegate = nil
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

let player = reproductor()
player.reproduce(audio: "ScaryOver")