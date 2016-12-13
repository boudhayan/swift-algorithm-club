//
//  Number.swift
//  
//
//  Created by Richard Ash on 10/28/16.
//
//

import Foundation

protocol Number: Multipliable, Addable {
  static var zero: Self { get }
}

protocol Addable {
  static func +(lhs: Self, rhs: Self) -> Self
  static func -(lhs: Self, rhs: Self) -> Self
}

protocol Multipliable {
  static func *(lhs: Self, rhs: Self) -> Self
}

extension Int: Number {
  static var zero: Int {
    return 0
  }
}

extension Double: Number {
  static var zero: Double {
    return 0.0
  }
}

extension Float: Number {
  static var zero: Float {
    return 0.0
  }
}


extension Array where Element: Number {
  func dot(_ b: Array<Element>) -> Element {
    let a = self
    assert(a.count == b.count, "Can only take the dot product of arrays of the same length!")
    let c = a.indices.map{ a[$0] * b[$0] }
    return c.reduce(Element.zero, { $0 + $1 })
  }
}
