//
//  ViewController.swift
//  TrafficLights
//
//  Created by SERGEY VOROBEV on 18.05.2021.
//

import UIKit

enum TrafficLightColors {
    case red, orange, green
}

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var orangeLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var trafficLightsControlButton: UIButton!
    
    // MARK: - Private Properties
    private var trafficLightState: TrafficLightColors?
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLights()
        switchOffLights()
    }
    
    // MARK: - IB Actions
    @IBAction func trafficLightsControlButton(_ sender: UIButton) {
        switchOffLights()
        
        if let currentLightState = trafficLightState {
            // Traffic lights is on, switch color
            switch currentLightState {
            case .red:
                trafficLightState = .orange
                orangeLight.alpha = 1
            case .orange:
                trafficLightState = .green
                greenLight.alpha = 1
            default:
                trafficLightState = .red
                redLight.alpha = 1
            }
        } else {
            // Traffic lights is off, change to on
            trafficLightState = .red
            redLight.alpha = 1
            
            trafficLightsControlButton.setTitle("NEXT", for: .normal)
        }
    }
    
    // MARK: - Private Methods
    private func configureLights() {
        redLight.layer.cornerRadius = redLight.frame.height / 2
        orangeLight.layer.cornerRadius = orangeLight.frame.height / 2
        greenLight.layer.cornerRadius = greenLight.frame.height / 2
    }
    
    private func switchOffLights() {
        redLight.alpha = 0.3
        orangeLight.alpha = 0.3
        greenLight.alpha = 0.3
    }
    

}

