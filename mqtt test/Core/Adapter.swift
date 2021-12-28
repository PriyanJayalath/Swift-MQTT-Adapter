//
//  Adapter.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

class Adapter: AdapterInterface {

    private var adaptee: MQTT!

    init(_ adaptee: MQTT) {
        self.adaptee = adaptee
    }

    override func connect(delegate:ConnectDelegate,broker:String) -> String {
        return "Adapter broker: " + adaptee.connect(delegate: delegate,broker: broker)
    }
    
    override func disconnect(delegate:DisconnectDelegate) {
        adaptee.disconnect(delegate: delegate)
    }
    
    override func subscribe(delegate: SubscribeDelegate, topic: String) {
        adaptee.subscribe(delegate: delegate, topic: topic)
    }
    
    override func publish(delegate: PublishDelegate, topic: String, payload: String) {
        adaptee.publish(delegate: delegate, topic: topic, payload: payload)
    }
}
