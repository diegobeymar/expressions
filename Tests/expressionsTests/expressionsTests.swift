import XCTest
import LogicKit
@testable import expressions

class expressionsTests: XCTestCase {

    func testToNumber() {
        let expected : Term = List.cons (Value (5), List.cons (Value (1), List.empty))
        XCTAssert (toNumber (51).equals (expected), "toNumber is incorrect")
    }

    func testReverse(){
        let v = Variable (named: "v")
        let goal = reverse(toNumber(1234), v)
        let expected = toNumber(4321)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "Reverse is incorrect")
        }
    }

    func testAdd()
    {
        let v = Variable(named: "v") //Contains result
        let a = 39
        let b = 27
        let goal = evalAdd(toNumber(a), toNumber(b) , v)
        let expected = toNumber(a+b)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "problem with addition")
            break
        }
    }


    func testMinus()
    {
        let v = Variable(named: "v") //Contains solution
        let a = 550
        let b = 270
        if a >= b {
            let goal = evalMinus(toNumber(a), toNumber(b), v)
            let expected = toNumber(a-b)
            for sub in solve(goal) {
                let r = sub.reified()
                XCTAssert(r[v].equals(expected), "problem with subtraction")
                break
            }
        }
    }


    func testMultiply() {
        let v = Variable (named: "v")
        let a = 3
        let b = 4
        let goal = evalMul(toNumber(a), toNumber(b), v)
        let expected = toNumber(a*b)
        for sub in solve(goal) {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "problem with multiplication")
            break
        }
    }


    func testDivide() // need time
    {
        var v = Variable (named: "v")
        var a = 20
        var b = 4
        var goal = evalDiv(toNumber(a), v, toNumber(b))
        var expected = toNumber(a/b)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "problem with ivision")
            break
        }

        v = Variable (named: "v")
        a = 12
        b = 4
        goal = evalDiv(toNumber(a), v, toNumber(b))
        expected = toNumber(a/b)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "problem with division")
            break
        }

        v = Variable (named: "v")
        a = 12
        b = 3
        goal = evalDiv(toNumber(a), v, toNumber(b))
        expected = toNumber(a/b)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "problem with division")
            break
        }

        v = Variable (named: "v")
        a = 10
        b = 2
        goal = evalDiv(toNumber(a), v, toNumber(b))
        expected = toNumber(a/b)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(expected), "problem with division")
            break
        }

    }

    func testAnd()
    {
        let v = Variable(named: "v")
        var goal = evalBoolean(input: and(t, t), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "T&T=T")
        }

        goal = evalBoolean(input: and(t, f), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(f), "T&F=F")
        }

        goal = evalBoolean(input: and(f, t), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(f), "F&T=F")
        }

        goal = evalBoolean(input: and(f, f), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(f), "F&F=F")
        }
    }

    func testOr()
    {
        let v = Variable(named: "v")

        var goal = evalBoolean(input: or(t, t), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "T|T=T")
        }

        goal = evalBoolean(input: or(t, f), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "T|F=T")
        }

        goal = evalBoolean(input: or(f, t), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "F|T=T")
        }

        goal = evalBoolean(input: or(f, f), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(f), "F|F=F")
        }
    }


    func testImplies()
    {
        let v = Variable(named: "v")

        var goal = evalBoolean(input: implies(t, t), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "T=>T=T")
        }

        goal = evalBoolean(input: implies(t, f), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(f), "T=>F=F")
        }

        goal = evalBoolean(input: implies(f, t), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "F=>T=T")
        }

        goal = evalBoolean(input: implies(f, f), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "F=>F=F")
        }
    }

    func testNot()
    {
        let v = Variable(named: "v")

        var goal = evalBoolean(input: not(t), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(f), "_T=F")
        }

        goal = evalBoolean(input: not(f), output: v)
        for sub in solve(goal)
        {
            let r = sub.reified()
            XCTAssert(r[v].equals(t), "_F=T")
        }

    }

    func testEqual()
   {
       let v = Variable(named: "v")
       let goal = evalComparison(equal(toNumber(3), toNumber(3)), v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t), "3 equal to 3")
       }
   }

   func testNotEqual()
   {
       let v = Variable(named: "v")
       let goal = evalComparison(notequal(toNumber(3), toNumber(4)), v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t), "3 not equal to 4")
       }
   }

   func testLessThan()
   {
       let v = Variable(named: "v")
       let goal = evalComparison(lessthan(toNumber(3), toNumber(40)), v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t), "3 less than 40")
           break
       }
   }

   func testGreaterThan()
   {
       let v = Variable(named: "v")
       let goal = evalComparison(greaterthan(toNumber(40), toNumber(4)), v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t), "40 greater than 4")
           break
       }
   }

   func testLessEqualThan()
   {
       let v = Variable(named: "v")
       let goal = evalComparison(lessequal(toNumber(2), toNumber(2)), v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t), "2 less or equal than 2")
           break
       }
   }

   func testGreaterEqualThan()
   {
       let v = Variable(named: "v")
       let goal = evalComparison(greaterequal(toNumber(2), toNumber(2)), v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t), "2 greater or equal than 2")
           break
       }
   }

   func testEval()
   {
       let v = Variable(named: "v")
       var goal = eval(input: and(t, t), output: v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t),"t&t=t")
       }

       goal = eval(input: greaterthan(toNumber(9), toNumber(8)), output: v)
       for sub in solve(goal)
       {
           let r = sub.reified()
           XCTAssert(r[v].equals(t),"9 greater than 8")
       }

       goal = eval(input: and(lessthan(toNumber(1), toNumber(2)), lessthan(toNumber(3),toNumber(4))), output: v)
       for sub in solve(goal) {
           let r = sub.reified()
           XCTAssert(r[v].equals(t),"(1<2)&(3<4) = t ")
       }
   }


    static var allTests : [(String, (expressionsTests) -> () throws -> Void)] {
        return [
            ("testToNumber", testToNumber),
            ("testAdd", testAdd),
           ("testMultiply", testMultiply),
           ("testDivide", testDivide),
           ("testMinus", testMinus),
           ("testReverse", testReverse),
           ("testAnd", testAnd),
           ("testOr", testOr),
           ("testImplies", testImplies),
           ("testNot", testNot),
           ("testEqual", testEqual),
           ("testNotEqual", testNotEqual),
           ("testLessThan", testLessThan),
           ("testGreaterThan", testGreaterThan),
           ("testLessEqualThan", testLessEqualThan),
           ("testGreaterEqualThan", testGreaterEqualThan),
           ("testEval", testEval),
        ]
    }

}
