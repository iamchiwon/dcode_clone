//
//  Container.swift
//  clonedcode
//
//  Created by iamchiwon on 2022/11/15.
//

import Foundation

class Container {
    static let shared = Container()

    enum Scope {
        case factory, single
    }

    private class InstanceItem {
        var builder: (() -> Any)?
        var instance: Any?
        init(builder: (() -> Any)?, instance: Any?) {
            self.builder = builder
            self.instance = instance
        }
    }

    private var instances: [String: InstanceItem] = [:]

    func regist<T>(_ builder: @escaping (Container) -> T) {
        regist(T.self, builder)
    }

    func regist<I, T>(_ name: I.Type = T.Type, _ builder: @escaping (Container) -> T) {
        let item = InstanceItem(builder: { builder(self) }, instance: nil)
        let iName = "\(I.self)"
        let tName = "\(T.self)"
        instances[iName] = item
        if iName != tName { instances[tName] = item }
    }

    func resolve<T>(_ type: T.Type) -> T? {
        let name = "\(T.self)"
        guard let item = instances[name] else { fatalError("regist \(name) instance first") }
        if item.instance != nil { return item.instance as? T }
        guard let builder = item.builder else { fatalError("can't instanciate \(name)") }

        item.instance = builder()
        item.builder = nil

        return item.instance as? T
    }
}

@propertyWrapper
public struct Injected<Value> {
    public private(set) var wrappedValue: Value
    public init() {
        wrappedValue = Container.shared.resolve(Value.self)!
    }

    public init<Target>(_ target: Target.Type) {
        wrappedValue = Container.shared.resolve(Target.self) as! Value
    }
}
