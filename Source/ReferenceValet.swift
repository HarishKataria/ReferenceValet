//**************************************************************
//                                                             *
//  ReferenceValet
//
//  Created by Harish Kataria
//  Copyright © 2018 Harish Kataria. All rights reserved.
//
//**************************************************************

import Foundation

/**
 * A ReferenceValet help pass references to closures without creating retaining
 * cycles or having to use captures list directly.
 */
public final class ReferenceValet {
    /* no state; for static use only */
    private init() {}
}

extension ReferenceValet {
    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     */
    public static func enclose<Reference>(reference: Reference,
                                          in closure: @escaping (Reference) -> Void) -> () -> Void
        where Reference: AnyObject {
        return { [weak reference] in
            guard let reference = reference else {
                return
            }
            closure(reference)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     */
    public static func enclose<Reference, A>(reference: Reference,
                                             in closure: @escaping (Reference, A) -> Void) -> (A) -> Void
        where Reference: AnyObject {
        return { [weak reference] (a: A) in
            guard let reference = reference else {
                return
            }
            closure(reference, a)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     */
    public static func enclose<Reference, A, B>(reference: Reference,
                                                in closure: @escaping (Reference, A, B) -> Void) -> (A, B) -> Void
        where Reference: AnyObject {
        return { [weak reference] (a: A, b: B) in
            guard let reference = reference else {
                return
            }
            closure(reference, a, b)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     */
    public static func enclose<Reference, A, B, C>(reference: Reference,
                                                   in closure: @escaping (Reference, A, B, C) -> Void) -> (A, B, C) -> Void
        where Reference: AnyObject {
        return { [weak reference] (a: A, b: B, c: C) in
            guard let reference = reference else {
                return
            }
            closure(reference, a, b, c)
        }
    }
}

extension ReferenceValet {
    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure's result or nil if reference
     *            doesn't exits
     */
    public static func enclose<Reference, Result>(reference: Reference,
                                                  in closure: @escaping (Reference) -> Result) -> () -> Result
        where Reference: AnyObject, Result: ExpressibleByNilLiteral {
        return { [weak reference] in
            guard let reference = reference else {
                return nil
            }
            return closure(reference)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure's result or nil if reference
     *            doesn't exits
     */
    public static func enclose<Reference, A, Result>(reference: Reference,
                                                     in closure: @escaping (Reference, A) -> Result) -> (A) -> Result
        where Reference: AnyObject, Result: ExpressibleByNilLiteral {
        return { [weak reference] (a: A) in
            guard let reference = reference else {
                return nil
            }
            return closure(reference, a)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure's result or nil if reference
     *            doesn't exits
     */
    public static func enclose<Reference, A, B, Result>(reference: Reference,
                                                        in closure: @escaping (Reference, A, B) -> Result) -> (A, B) -> Result
        where Reference: AnyObject, Result: ExpressibleByNilLiteral {
        return { [weak reference] (a: A, b: B) in
            guard let reference = reference else {
                return nil
            }
            return closure(reference, a, b)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure's result or nil if reference
     *            doesn't exits
     */
    public static func enclose<Reference, A, B, C, Result>(reference: Reference,
                                                           in closure: @escaping (Reference, A, B, C) -> Result) -> (A, B, C) -> Result
        where Reference: AnyObject, Result: ExpressibleByNilLiteral {
            return { [weak reference] (a: A, b: B, c: C) in
                guard let reference = reference else {
                    return nil
                }
                return closure(reference, a, b, c)
            }
    }
}

extension ReferenceValet {
    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public static func enclose<Reference, Result>(reference: Reference,
                                                  defaultingTo result: Result,
                                                  in closure: @escaping (Reference) -> Result) -> () -> Result
        where Reference: AnyObject {
        return { [weak reference] in
            guard let reference = reference else {
                return result
            }
            return closure(reference)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public static func enclose<Reference, A, Result>(reference: Reference,
                                                     defaultingTo result: Result,
                                                     in closure: @escaping (Reference, A) -> Result) -> (A) -> Result
        where Reference: AnyObject {
        return { [weak reference] (a: A) in
            guard let reference = reference else {
                return result
            }
            return closure(reference, a)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public static func enclose<Reference, A, B, Result>(reference: Reference,
                                                        defaultingTo result: Result,
                                                        in closure: @escaping (Reference, A, B) -> Result) -> (A, B) -> Result
        where Reference: AnyObject {
        return { [weak reference] (a: A, b: B) in
            guard let reference = reference else {
                return result
            }
            return closure(reference, a, b)
        }
    }

    /**
     * Passes the given reference as an argument instead of having
     * to create a capture list and check boilerplate code
     *
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the business logic
     *
     * - returns: the wrapped closure
     */
    public static func enclose<Reference, A, B, C, Result>(reference: Reference,
                                                           defaultingTo result: Result,
                                                           in closure: @escaping (Reference, A, B, C) -> Result) -> (A, B, C) -> Result
        where Reference: AnyObject {
            return { [weak reference] (a: A, b: B, c: C) in
                guard let reference = reference else {
                    return result
                }
                return closure(reference, a, b, c)
            }
    }
}

extension ReferenceValet {
    /**
     * Calls the given closure with the reference passed to it (instead of having
     * to add capture list and then check if reference exists).
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     */
    public static func call<Reference>(_ target: (@escaping () -> Void) throws -> Void,
                                       with reference: Reference,
                                       on closure: @escaping (Reference) -> Void) rethrows
        where Reference: AnyObject {
        try target(enclose(reference: reference, in: closure))
    }

    /**
     * Calls the given closure with the reference passed to it (instead of having
     * to add capture list and then check if reference exists).
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter reference: reference to pass without retaining
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     *
     * - returns: the result of the target function
     */
    public static func call<Reference, X, Y>(_ target: (@escaping () -> X) throws -> Y,
                                             with reference: Reference,
                                             on closure: @escaping (Reference) -> X) rethrows -> Y
        where Reference: AnyObject, X: ExpressibleByNilLiteral {
        return try target(enclose(reference: reference, in: closure))
    }

    /**
     * Calls the given closure with the reference passed to it (instead of having
     * to add capture list and then check if reference exists).
     *
     * - parameter target: the function to pass the trailing closure to
     * - parameter reference: reference to pass without retaining
     * - parameter result: the default result in case the reference no long exists
     * - parameter closure: closure containing the final argument to be
     *                      passed to the target function
     *
     * - returns: the result of the target function
     */
    public static func call<Reference, X, Y>(_ target: (@escaping () -> X) throws -> Y,
                                             with reference: Reference,
                                             defaultingTo result: X,
                                             on closure: @escaping (Reference) -> X) rethrows -> Y
        where Reference: AnyObject {
        return try target(enclose(reference: reference, defaultingTo: result, in: closure))
    }
}

extension ReferenceValet {
    /**
     * Calls async on the given dispatch queue (or the main queue if not specified)
     * with the closure that is supplied with the give reference. Saves adding the
     * capture list and checking if reference exists.
     *
     * - parameter reference: reference to pass without retaining
     * - parameter queue: queue to run task on
     * - parameter closure: closure containing the task
     */
    public static func async<Reference>(_ reference: Reference,
                                        on queue: DispatchQueue = DispatchQueue.main,
                                        in closure: @escaping (Reference) -> Void)
        where Reference: AnyObject {
        queue.async(execute: enclose(reference: reference, in: closure))
    }
}
