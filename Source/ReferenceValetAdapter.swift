//**************************************************************
//
//  ReferenceValet
//
//  Created by Harish Kataria
//  Copyright © 2018 Harish Kataria. All rights reserved.
//
//**************************************************************

import Foundation

/**
 * A protocol to share ReferenceValet-powered closure shortcuts
 */
public protocol ReferenceValetAdopter: class {}

extension ReferenceValetAdopter {
    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     */
    public func enclose(in closure: @escaping (Self) -> Void) -> () -> Void {
        return ReferenceValet.enclose(reference: self, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     */
    public func enclose<A>(in closure: @escaping (Self, A) -> Void) -> (A) -> Void {
        return ReferenceValet.enclose(reference: self, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     */
    public func enclose<A, B>(in closure: @escaping (Self, A, B) -> Void) -> (A, B) -> Void {
        return ReferenceValet.enclose(reference: self, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     */
    public func enclose<A, B, C>(in closure: @escaping (Self, A, B, C) -> Void) -> (A, B, C) -> Void {
        return ReferenceValet.enclose(reference: self, in: closure)
    }
}

extension ReferenceValetAdopter {
    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the givens closure's result or nil if reference
     *            doesn't exits
     */
    public func enclose<Result>(in closure: @escaping (Self) -> Result) -> () -> Result
        where Result: ExpressibleByNilLiteral {
        return ReferenceValet.enclose(reference: self, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the givens closure's result or nil if reference
     *            doesn't exits
     */
    public func enclose<Result, A>(in closure: @escaping (Self, A) -> Result) -> (A) -> Result
        where Result: ExpressibleByNilLiteral {
            return ReferenceValet.enclose(reference: self, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the givens closure's result or nil if reference
     *            doesn't exits
     */
    public func enclose<Result, A, B>(in closure: @escaping (Self, A, B) -> Result) -> (A, B) -> Result
        where Result: ExpressibleByNilLiteral {
            return ReferenceValet.enclose(reference: self, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the givens closure's result or nil if reference
     *            doesn't exits
     */
    public func enclose<Result, A, B, C>(in closure: @escaping (Self, A, B, C) -> Result) -> (A, B, C) -> Result
        where Result: ExpressibleByNilLiteral {
            return ReferenceValet.enclose(reference: self, in: closure)
    }
}

extension ReferenceValetAdopter {
    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public func enclose<Result>(defaultingTo result: Result,
                                in closure: @escaping (Self) -> Result) -> () -> Result {
        return ReferenceValet.enclose(reference: self, defaultingTo: result, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public func enclose<Result, A>(defaultingTo result: Result,
                                   in closure: @escaping (Self, A) -> Result) -> (A) -> Result {
        return ReferenceValet.enclose(reference: self, defaultingTo: result, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public func enclose<Result, A, B>(defaultingTo result: Result,
                                      in closure: @escaping (Self, A, B) -> Result) -> (A, B) -> Result {
        return ReferenceValet.enclose(reference: self, defaultingTo: result, in: closure)
    }

    /**
     * Passes self as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public func enclose<Result, A, B, C>(defaultingTo result: Result,
                                         in closure: @escaping (Self, A, B, C) -> Result) -> (A, B, C) -> Result {
        return ReferenceValet.enclose(reference: self, defaultingTo: result, in: closure)
    }
}

extension ReferenceValetAdopter {
    /**
     * Calls the given closure with self passed to it (instead of having
     * to add capture list and then check if reference exists).
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     */
    public func call(_ target: (@escaping () -> Void) throws -> Void,
                     with closure: @escaping (Self) -> Void) rethrows {
        try ReferenceValet.call(target, with: self, on: closure)
    }

    /**
     * Calls the given closure with self passed to it (instead of having
     * to add capture list and then check if reference exists).
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     *
     * - returns: the result of the target function
     */
    public func call<X, Y>(_ target: (@escaping () -> X) throws -> Y,
                           with closure: @escaping (Self) -> X) rethrows -> Y
        where X: ExpressibleByNilLiteral {
        return try ReferenceValet.call(target, with: self, on: closure)
    }

    /**
     * Calls the given closure with self passed to it (instead of having
     * to add capture list and then check if reference exists).
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter result: the default result in case the reference no long exists
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     *
     * - returns: the result of the target function
     */
    public func call<X, Y>(_ target: (@escaping () -> X) throws -> Y,
                           defaultingTo result: X,
                           on closure: @escaping (Self) -> X) rethrows -> Y {
        return try ReferenceValet.call(target, with: self, defaultingTo: result, on: closure)
    }
}

extension ReferenceValetAdopter {
    /**
     * Calls async on the given dispatch queue (or the main queue if not specified)
     * with the closure that is supplied. Saves adding the capture list and checking
     * if reference exists.
     *
     * - parameter queue: queue to run task on
     * - parameter closure: closure containing the task
     */
    public func async(on queue: DispatchQueue = DispatchQueue.main,
                      with closure: @escaping (Self) -> Void) {
        return ReferenceValet.async(self, on: queue, in: closure)
    }
}

extension ReferenceValetAdopter {
    /**
     * Calls the given closure with given argument and self passed to it (instead
     * of having to add capture list and then check if reference exists)
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter a: first argument to pass to the target function
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     */
    public func call<A>(_ target: (A, @escaping () -> Void) throws -> Void,
                        _ a: A,
                        with closure: @escaping (Self) -> Void) rethrows {
        try target(a, ReferenceValet.enclose(reference: self, in: closure))
    }

    /**
     * Calls the given closure with given arguments and self passed to it (instead
     * of having to add capture list and then check if reference exists)
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter a: first argument to pass to the target function
     * - parameter b: second argument to pass to the target function
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     */
    public func call<A, B>(_ target: (A, B, @escaping () -> Void) throws -> Void,
                           _ a: A,
                           _ b: B,
                           with closure: @escaping (Self) -> Void) rethrows {
        try target(a, b, ReferenceValet.enclose(reference: self, in: closure))
    }

    /**
     * Calls the given closure with given arguments and self passed to it (instead
     * of having to add capture list and then check if reference exists)
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter a: first argument to pass to the target function
     * - parameter b: second argument to pass to the target function
     * - parameter c: third argument to pass to the target function
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     */
    public func call<A, B, C>(_ target: (A, B, C, @escaping () -> Void) throws -> Void,
                              _ a: A,
                              _ b: B,
                              _ c: C,
                              with closure: @escaping (Self) -> Void) rethrows {
        try target(a, b, c, ReferenceValet.enclose(reference: self, in: closure))
    }
}

extension ReferenceValetAdopter {
    /**
     * Calls the given closure with given argument and self passed to it (instead
     * of having to add capture list and then check if reference exists)
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter a: first argument to pass to the target function
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     *
     * - returns: the result of the target function
     */
    public func call<X, Y, A>(_ target: (A, @escaping () -> X) throws -> Y,
                              _ a: A,
                              with closure: @escaping (Self) -> X) rethrows -> Y
        where X: ExpressibleByNilLiteral {
        return try target(a, ReferenceValet.enclose(reference: self, in: closure))
    }

    /**
     * Calls the given closure with given arguments and self passed to it (instead
     * of having to add capture list and then check if reference exists)
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter a: first argument to pass to the target function
     * - parameter b: second argument to pass to the target function
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     *
     * - returns: the result of the target function
     */
    public func call<X, Y, A, B>(_ target: (A, B, @escaping () -> X) throws -> Y,
                                 _ a: A,
                                 _ b: B,
                                 with closure: @escaping (Self) -> X) rethrows -> Y
        where X: ExpressibleByNilLiteral {
        return try target(a, b, ReferenceValet.enclose(reference: self, in: closure))
    }

    /**
     * Calls the given closure with given arguments and self passed to it (instead
     * of having to add capture list and then check if reference exists)
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter a: first argument to pass to the target function
     * - parameter b: second argument to pass to the target function
     * - parameter c: third argument to pass to the target function
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     *
     * - returns: the result of the target function
     */
    public func call<X, Y, A, B, C>(_ target: (A, B, C, @escaping () -> X) throws -> Y,
                                    _ a: A,
                                    _ b: B,
                                    _ c: C,
                                    with closure: @escaping (Self) -> X) rethrows -> Y
        where X: ExpressibleByNilLiteral {
        return try target(a, b, c, ReferenceValet.enclose(reference: self, in: closure))
    }
}
