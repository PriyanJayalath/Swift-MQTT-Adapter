//
//  ViewController.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-27.
//

import UIKit

class ViewController: UIViewController{
    
    var adapter:Adapter!
    
    @IBAction func btnConnectClicked(_ sender: Any) {
        print("connect")
        Client.connect(target: adapter,delegate: self,broker: edt_broker.text!)
    }
    
    @IBAction func btnSubscibeClicked(_ sender: Any) {
        print("Subscibe")
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //appDelegate.subscribe(topic: "mqtt/topic")
        Client.subscribe(target: adapter, delegate: self, topic: edt_topic.text!)
    }
    
    @IBAction func btnSendClicked(_ sender: Any) {
        Client.publish(target: adapter, delegate: self, topic: edt_topic.text!, payload: edt_message.text!)
    }
    
    @IBOutlet weak var edt_broker: UITextField!
    
    @IBOutlet weak var edt_message: UITextField!
    
    @IBOutlet weak var edt_topic: UITextField!
    
    @IBOutlet weak var lbl_message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let adaptee = CocoaMQTTClient()
        let adaptee = SwiftyMQTTClient()
        adapter = Adapter(adaptee)
    }


}
extension ViewController: ConnectDelegate {
    func connectionSuccess() -> String {
        return "Sucess"
    }
    
    func connectionFail() {
        
    }
}

extension ViewController: DisconnectDelegate {
    func disconnectSuccess() {
        
    }
    
    func disconnectFail() {
        
    }
}

extension ViewController: SubscribeDelegate {
    func subscriptionSuccess() {
        print("Subscribe Sucess")
    }
    
    func subscriptionFail() {
        
    }
    
    func messageReceived(payload: String) {
        self.lbl_message.text = payload
    }
}

extension ViewController: PublishDelegate {
    func publishSuccess() {
        
    }
    
    func publishFail() -> String {
        return "Failed to publish"
    }
}

