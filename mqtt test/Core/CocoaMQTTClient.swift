//
//  CocoaMQTTClient.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

import CocoaMQTT

class CocoaMQTTClient:MQTT {
    
    var connectdelegate:ConnectDelegate!
    var disconnectDelegate:DisconnectDelegate!
    var subscribeDelegate:SubscribeDelegate!
    var publishDelegate:PublishDelegate!
    
    var mqtt: CocoaMQTT!

    func connect(delegate:ConnectDelegate,broker:String) -> String {
        self.connectdelegate = delegate
        
        mqtt = CocoaMQTT(clientID: "test123", host: broker, port: 1883)
        mqtt.delegate = self
        mqtt.keepAlive = 60
        mqtt.enableSSL = false
        mqtt.autoReconnect = true
        mqtt.cleanSession = true
        mqtt.connect()
        
        return "CocoaMQTT Connect"
    }
    
    func subscribe(delegate: SubscribeDelegate, topic: String) {
        self.subscribeDelegate = delegate
        mqtt.subscribe(topic)
    }
    
    func publish(delegate: PublishDelegate, topic: String, payload: String) {
        self.publishDelegate = delegate
        mqtt.publish(topic, withString: payload)
    }
    
    func disconnect(delegate: DisconnectDelegate) {
        self.disconnectDelegate = delegate
        mqtt.disconnect()
    }
    
}
extension CocoaMQTTClient: CocoaMQTTDelegate {
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("mqtt mqttDidDisconnect!!")
        //guard connectdelegate == nil else {
        //  return
        //}
        connectdelegate.connectionFail()
    }
    
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("mqtt CocoaMQTTConnAck!!")
        //guard connectdelegate == nil else {
        //  print("Connect issue")
        //  return
        //}
        connectdelegate.connectionSuccess()
        //mqtt.subscribe("mqtt/topic")
                
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("mqtt didPublishMessage!!")
        publishDelegate.publishSuccess()
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("mqtt didPublishAck!!")
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        subscribeDelegate.messageReceived(payload: (String(bytes: message.payload, encoding: .utf8) ?? ""))
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {
        print("mqtt didSubscribeTopic!!")
        print(topics)
        subscribeDelegate.subscriptionSuccess()
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("mqtt didUnsubscribeTopic!!")
        print(topic)
        subscribeDelegate.subscriptionFail()
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print("mqtt mqttDidPing!!")
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print("mqtt mqttDidReceivePong!!")
    }
    
}
