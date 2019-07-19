//
//  ViewController.swift
//  RadioUFT
//
//  Created by Paulo Sérgio Atavila Júnior on 29/09/17.
//  Copyright © 2017 Paulo Atavila. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    var contEasterEgg = 0
    @IBAction func fabSoftBtt(_ sender: Any) {
        contEasterEgg+=1
        if contEasterEgg == 3 {
            contEasterEgg = 0
            if let chamaTelaV = storyboard?.instantiateViewController(withIdentifier: "fabSoft"){
                self.present(chamaTelaV, animated: true, completion: nil)
            }
        }
    }
    
    @IBOutlet weak var nomeProgramaLabel: UILabel!
    @IBOutlet weak var capaProgramaImg: UIImageView!
    @IBOutlet weak var playPauseOutlet: UIButton!
    @IBAction func abrirFecharSeta(_ sender: Any) {
//        if abrirFecharSeta.currentImage == #imageLiteral(resourceName: "seta"){
//            abrirFecharSeta.setImage(#imageLiteral(resourceName: "x"), for: .normal)
//            UIView.animate(withDuration: 0.3, animations: {
//                self.faceBttOutlet.alpha = 1
//                self.insttagramBttOutlet.alpha = 1
//                self.twitterBttOutlet.alpha = 1
//                self.youtubeBttOutlet.alpha = 1
//                
//                self.faceBttOutlet.center = self.faceBttPosition
//                self.insttagramBttOutlet.center = self.instagramBttPosition
//                self.twitterBttOutlet.center = self.twitterBttPosition
//                self.youtubeBttOutlet.center = self.youtubeBttPosition
//                self.abrirFecharSeta.transform = CGAffineTransform(rotationAngle: 110.0)
//            })
//        } else {
//            abrirFecharSeta.setImage(#imageLiteral(resourceName: "seta"), for: .normal)
//            UIView.animate(withDuration: 0.3, animations: {
//                self.faceBttOutlet.alpha = 0
//                self.insttagramBttOutlet.alpha = 0
//                self.twitterBttOutlet.alpha = 0
//                self.youtubeBttOutlet.alpha = 0
//                
//                self.faceBttOutlet.center = self.abrirFecharSeta.center
//                self.insttagramBttOutlet.center = self.abrirFecharSeta.center
//                self.twitterBttOutlet.center = self.abrirFecharSeta.center
//                self.youtubeBttOutlet.center = self.abrirFecharSeta.center
//                self.abrirFecharSeta.transform = CGAffineTransform(rotationAngle: 0)
//            })
//        }
    }
    @IBOutlet weak var abrirFecharSeta: UIButton!
    @IBAction func faceBtt(_ sender: Any) {
        //Facebook:
        let facebookHooks = "fb://profile/1502988100017597"
        let facebookUrl = NSURL(string: facebookHooks)
        if UIApplication.shared.canOpenURL(facebookUrl! as URL){
            UIApplication.shared.openURL(facebookUrl! as URL)
        } else {
            //redirect to safari because the user doesn't have Facebook
            UIApplication.shared.openURL(NSURL(string: "http://facebook.com/uftfm")! as URL)
        }
        
    }
    @IBOutlet weak var faceBttOutlet: UIButton!
    @IBAction func twitterBtt(_ sender: Any) {
        //Twitter
        let twitterHooks = "twitter://user?screen_name=UFToficial"
        let twitterUrl = NSURL(string: twitterHooks)
        if UIApplication.shared.canOpenURL(twitterUrl! as URL){
            UIApplication.shared.openURL(twitterUrl! as URL)
        } else {
            //redirect to safari because the user doesn't have Twitter
            UIApplication.shared.openURL(NSURL(string: "https://twitter.com/UFToficial")! as URL)
        }
    }
    @IBOutlet weak var twitterBttOutlet: UIButton!
    @IBAction func instagramBtt(_ sender: Any) {
        //Instagram:
        let instagramHooks = "instagram://user?username=uftfm"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL){
            UIApplication.shared.openURL(instagramUrl! as URL)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.openURL(NSURL(string: "http://instagram.com/uftfm")! as URL)
        }
        
    }
    @IBOutlet weak var insttagramBttOutlet: UIButton!
    @IBAction func youtubeBtt(_ sender: Any) {
        //Youtube
        let twitterHooks = "youtube://user/UFToficial"
        let twitterUrl = NSURL(string: twitterHooks)
        if UIApplication.shared.canOpenURL(twitterUrl! as URL){
            UIApplication.shared.openURL(twitterUrl! as URL)
        } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.openURL(NSURL(string: "https://youtube.com/UFToficial")! as URL)
        }
    }
    @IBOutlet weak var youtubeBttOutlet: UIButton!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var loaderActivity: UIActivityIndicatorView!
    @IBAction func playPauseBtt(_ sender: Any) {
        if tocando {
            player.replaceCurrentItem(with: nil)
            tocando = false
            
            playPauseOutlet.setImage(UIImage(named: "play"), for: UIControlState.normal)
            /*
             Código para transição de imagens
            
            UIView.transition(with: capaProgramaImg,
                              duration:1,
                              options: .transitionCrossDissolve,
                              animations: { self.capaProgramaImg.image = UIImage(named: "uftfm") },
                              completion: nil)
            nomeProgramaLabel.text = "UFTFM 96,9"
            */
            
            /*
             Código para voltar o bloco de player nativo para a imagem da rádio, na versão 1.0, não será necessário utiliza-ló
             
 
            let mpic = MPNowPlayingInfoCenter.default()
            let image:UIImage = UIImage(named: "uftfm")!
            if #available(iOS 10.0, *) {
                let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
                    return image
                })
                mpic.nowPlayingInfo = [MPMediaItemPropertyTitle:"UFTFM 96,9",
                                       MPMediaItemPropertyArtwork:artwork]
            } else {
                // Fallback on earlier versions
            }
             */
            
        } else {
            let url = "http://caqui.uft.edu.br:8000/uftfm"
            player = AVPlayer(url: URL(string: url)!)
            player.volume = 1.0
            player.rate = 1.0
            player.play()
            tocando = true
            playPauseOutlet.setImage(UIImage(named: "pause"), for: UIControlState.normal)
            
            loaderView.isHidden = false
            loaderActivity.startAnimating()
            
            addPeriodicTimeObserver()
            
            /*
             Código para transição de imagens
             
             
            UIView.transition(with: capaProgramaImg,
                                      duration:3,
                                      options: .transitionCrossDissolve,
                                      animations: { self.capaProgramaImg.image = UIImage(named: "programa1") },
                                      completion: nil)
            nomeProgramaLabel.text = "A Hora do Rock"
             */
            
            let session = AVAudioSession.sharedInstance()
            do {
                try session.setCategory(AVAudioSessionCategoryPlayback)
            } catch {
                print("******* Deu erro na instancia de backgroud")
            }
            
            //Como na versão 1.0 ficará sempre a msm imagem como capa de reprodução, utilizaremos o código abaixo quando for pressionado o play, para setar a imagem da rádio no bloco de player nativo:
            let mpic = MPNowPlayingInfoCenter.default()
            let image:UIImage = UIImage(named: "uftfm")!
            if #available(iOS 10.0, *) {
                let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
                    return image
                })
                mpic.nowPlayingInfo = [MPMediaItemPropertyTitle:"UFTFM 96,9",
                                       MPMediaItemPropertyArtwork:artwork]
            } else {
                // Fallback on earlier versions
            }
            
            /*
             Código para colocar a imagem do programa no bloco de player nativo
             
            let mpic = MPNowPlayingInfoCenter.default()
            
 
            let image:UIImage = UIImage(named: "programa1")!
            if #available(iOS 10.0, *) {
                let artwork = MPMediaItemArtwork.init(boundsSize: image.size, requestHandler: { (size) -> UIImage in
                    return image
                })
                mpic.nowPlayingInfo = [MPMediaItemPropertyTitle:"A hora do Rock",
                                       MPMediaItemPropertyArtwork:artwork]
            } else {
                // Fallback on earlier versions
            }
             */
        }
    }
    var player = AVPlayer()
    var tocando = false
    var timeObserverToken:Any?
    var faceBttPosition: CGPoint!
    var instagramBttPosition: CGPoint!
    var twitterBttPosition: CGPoint!
    var youtubeBttPosition: CGPoint!
    
//    var moviePlayer:MPMoviePlayerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        faceBttPosition = faceBttOutlet.center
        instagramBttPosition = insttagramBttOutlet.center
        twitterBttPosition = twitterBttOutlet.center
        youtubeBttPosition = youtubeBttOutlet.center
        
        UIView.animate(withDuration: 0.3, animations: {
            self.faceBttOutlet.alpha = 1
            self.insttagramBttOutlet.alpha = 1
            self.twitterBttOutlet.alpha = 1
            self.youtubeBttOutlet.alpha = 1
            
            self.faceBttOutlet.center = self.faceBttPosition
            self.insttagramBttOutlet.center = self.instagramBttPosition
            self.twitterBttOutlet.center = self.twitterBttPosition
            self.youtubeBttOutlet.center = self.youtubeBttPosition
        })
        
//        DispatchQueue.main.async {
//            self.faceBttOutlet.center = self.abrirFecharSeta.center
//            self.insttagramBttOutlet.center = self.abrirFecharSeta.center
//            self.twitterBttOutlet.center = self.abrirFecharSeta.center
//            self.youtubeBttOutlet.center = self.abrirFecharSeta.center
//        }
        
        
        
        tocando = false
        loaderView.isHidden = true
        
        self.capaProgramaImg.layer.cornerRadius = capaProgramaImg.frame.width/20.0
        self.capaProgramaImg.clipsToBounds = true
        
//        self.mainImageView.layer.cornerRadius = CGRectGetWidth(self.mainImageView.frame)/4.0
//        self.mainImageView.clipsToBounds = true
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.pauseCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
            self.playPauseBtt((Any).self)
            return .success
        }
        
        commandCenter.playCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
            self.playPauseBtt((Any).self)
            return .success
        }
        
        //https://sistemas.uft.edu.br/agenda/fullcalendar?o=1&a[]=34&start=2017-09-21&end=2017-09-30%27
        //https://sistemas.uft.edu.br/agenda/arquivos/ ...
        

        
//        let url = "http://caqui.uft.edu.br:8000/uftfm"
        
//
    
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPeriodicTimeObserver() {
        // Invoke callback every half second
        let interval = CMTime(seconds: 0.5,
                              preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        // Queue on which to invoke the callback
        let mainQueue = DispatchQueue.main
        // Add time observer
        timeObserverToken =
            player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue) {
                [weak self] time in
                self?.bufferState()
        }
    }
    
    func removePeriodicTimeObserver() {
        // If a time observer exists, remove it
        if let token = timeObserverToken {
            player.removeTimeObserver(token)
            timeObserverToken = nil
        }
    }
    
    private func bufferState() {
        if let currentItem = player.currentItem {
            if currentItem.status == AVPlayerItemStatus.readyToPlay {
                if currentItem.isPlaybackLikelyToKeepUp {
                    print("Playing ")
                    loaderActivity.stopAnimating()
                    loaderView.isHidden = true
                    removePeriodicTimeObserver()
                } else if currentItem.isPlaybackBufferEmpty {
                    print("Buffer empty - show loader")
                }  else if currentItem.isPlaybackBufferFull {
                    print("Buffer full - hide loader")
                    loaderActivity.stopAnimating()
                    loaderView.isHidden = true
                } else {
                    print("Buffering ")
                }
            } else if currentItem.status == AVPlayerItemStatus.failed {
                print("Failed ")
            } else if currentItem.status == AVPlayerItemStatus.unknown {
                print("Unknown ")
                
            }
        } else {
            print("avPlayer.currentItem is nil")
            loaderActivity.stopAnimating()
            loaderView.isHidden = true
        }
    }

}

