//
//  Client.swift
//  mqtt test
//
//  Created by Priyan Jayalath on 2021-12-28.
//

class Client {
    static func connect(target: AdapterInterface,delegate:ConnectDelegate,broker:String) {
        print(target.connect(delegate: delegate,broker: broker))
    }
    static func disconnect(target: AdapterInterface,delegate:DisconnectDelegate,broker:String) {
        target.disconnect(delegate: delegate)
    }
    static func subscribe(target: AdapterInterface,delegate:SubscribeDelegate,topic:String) {
        target.subscribe(delegate: delegate, topic: topic)
    }
    static func publish(target: AdapterInterface,delegate:PublishDelegate,topic:String,payload:String) {
        target.publish(delegate: delegate, topic: topic, payload: payload)
    }
}
