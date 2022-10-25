
import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player : AVAudioPlayer!
    var timer = Timer()
    var eggSecs : [String : Float] = ["Soft" : 3 , "Medium" : 480, "Hard" : 720]
    let eggTimes : [String : Float] = ["Soft" : 3, "Medium": 480, "Hard" : 720]
    var secsGone : Float = 0.0
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var eggTitle: UILabel!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
    
      eggTitle.text = "How do you like your eggs?"
      timer.invalidate()
        if eggSecs[sender.currentTitle!]! == eggTimes[sender.currentTitle!]!{
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
                (Timer) in if self.eggSecs[sender.currentTitle!]! > 0{
                      self.secsGone+=1
                    let splitSec = self.secsGone / self.eggTimes[sender.currentTitle!]!
                    self.progressBar.progress = splitSec
                      
                     // print("\(self.eggSecs[sender.currentTitle!]!) seconds")
                      self.eggSecs[sender.currentTitle!]!-=1
                    self.eggTitle.text = "\(self.eggSecs[sender.currentTitle!]!) seconds remaining"
                  } else {
                      Timer.invalidate()
                  
                      self.secsGone = 0
                      self.eggTitle.text = "Done"
                      self.playSound(file: "alarm_sound")
                  }
              }
        } else{
            eggSecs.updateValue(300, forKey: "Soft")
            eggSecs.updateValue(480, forKey: "Medium")
            eggSecs.updateValue(720, forKey: "Hard")
            secsGone = 0
            
        }
    
    
      }
    
    func playSound(file: String) {
        let url = Bundle.main.url(forResource: file, withExtension: "mp3")
              player = try! AVAudioPlayer(contentsOf: url!)
              player.play()

    }
  
   
    }

