//
//  SwiftyMQTTClient.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

import SwiftMQTT

class SwiftyMQTTClient:MQTT {
    
    var connectdelegate:ConnectDelegate!
    var disconnectDelegate:DisconnectDelegate!
    var subscribeDelegate:SubscribeDelegate!
    var publishDelegate:PublishDelegate!
    
    var mqtt: MQTTSession!

    func connect(delegate:ConnectDelegate,broker:String) -> String {
        self.connectdelegate = delegate
        
        mqtt = MQTTSession(
            host: broker,
            port: 1883,
            clientID: "swift", // must be unique to the client
            cleanSession: true,
            keepAlive: 15,
            useSSL: false
        )
        mqtt.delegate = self
        mqtt.connect { error in
            if error == .none {
                print("Connected!")
                self.connectdelegate.connectionSuccess()
            } else {
                print(error.description)
                self.connectdelegate.connectionFail()
            }
        }
        
        return "CocoaMQTT Connect"
    }
    
    func subscribe(delegate: SubscribeDelegate, topic: String) {
        self.subscribeDelegate = delegate
        
        mqtt.subscribe(to: topic, delivering: .atLeastOnce) { error in
            if error == .none {
                print("Subscribed to \(topic)!")
            } else {
                print(error.description)
            }
        }
    }
    
    func publish(delegate: PublishDelegate, topic: String, payload: String) {
        self.publishDelegate = delegate
        
        let data = Data(payload.utf8)

        mqtt.publish(data, in: topic, delivering: .atLeastOnce, retain: false) { error in
            if error == .none {
                print("Published data in \(topic)!")
            } else {
                print(error.description)
            }
        }
        
    }
    
    func disconnect(delegate: DisconnectDelegate) {
        self.disconnectDelegate = delegate
        mqtt.disconnect()
    }
    
}
extension SwiftyMQTTClient: MQTTSessionDelegate {
    func mqttDidReceive(message: MQTTMessage, from session: MQTTSession) {
        subscribeDelegate.messageReceived(payload: (String(bytes: message.payload, encoding: .utf8) ?? ""))
    }
    
    func mqttDidAcknowledgePing(from session: MQTTSession) {
        
    }
    
    func mqttDidDisconnect(session: MQTTSession, error: MQTTSessionError) {
        connectdelegate.connectionFail()
    }
    
}
