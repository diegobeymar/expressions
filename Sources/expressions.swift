import LogicKit

// Numbers:

let d0 = Value (0)
let d1 = Value (1)
let d2 = Value (2)
let d3 = Value (3)
let d4 = Value (4)
let d5 = Value (5)
let d6 = Value (6)
let d7 = Value (7)
let d8 = Value (8)
let d9 = Value (9)

func toNumber (_ n : Int) -> Term {
    var result = List.empty
    for char in String (n).characters.reversed () {
        switch char {
        case "0":
            result = List.cons (d0, result)
        case "1":
            result = List.cons (d1, result)
        case "2":
            result = List.cons (d2, result)
        case "3":
            result = List.cons (d3, result)
        case "4":
            result = List.cons (d4, result)
        case "5":
            result = List.cons (d5, result)
        case "6":
            result = List.cons (d6, result)
        case "7":
            result = List.cons (d7, result)
        case "8":
            result = List.cons (d8, result)
        case "9":
            result = List.cons (d9, result)
        default:
            assert (false)
        }
    }
    return result
}

// Arithmetic:

func add (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op"  : Value ("+"),
      "lhs" : lhs,
      "rhs" : rhs,]
}

func subtract (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op"  : Value ("-"),
      "lhs" : lhs,
      "rhs" : rhs,]
}

func multiply (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op"  : Value ("*"),
      "lhs" : lhs,
      "rhs" : rhs,]
}

func divide (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op"  : Value ("/"),
      "lhs" : lhs,
      "rhs" : rhs,]
}

// Booleans:

let t = Value (true)
let f = Value (false)

func not (_ of: Term) -> Map {
  return [
      "op": Value ("not"),
      "what": of,]
}

func and (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value ("and"),
      "lhs": lhs,
      "rhs": rhs,]
}

func or (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value ("or"),
      "lhs": lhs,
      "rhs": rhs,]
}

func implies (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value ("implies"),
      "lhs": lhs,
      "rhs": rhs,]
}

// Comparisons:

func lessthan (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value ("<"),
      "lhs": lhs,
      "rhs": rhs,]
}

func lessequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value ("<="),
      "lhs": lhs,
      "rhs": rhs,]
}

func greaterthan (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value (">"),
      "lhs": lhs,
      "rhs": rhs,]
}

func greaterequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value (">="),
      "lhs": lhs,
      "rhs": rhs,]
}

func equal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value ("="),
      "lhs": lhs,
      "rhs": rhs,]
}

func notequal (_ lhs: Term, _ rhs: Term) -> Map {
  return [
      "op": Value ("!="),
      "lhs": lhs,
      "rhs": rhs,]
}


func addDigit(_ lhs: Term, _ rhs: Term, _ result: Term, _ rest: Term)-> Goal
{
    return
        (lhs === d0 && result === rhs && rest === d0) ||
            (rhs === d0 && result === lhs && rest === d0) ||

            //Cette fonction ajoude des digits, chaque pavé corresponds à un membre à gauche

            //lhs=1
            ((lhs === d1) && (rhs === d1) && (result === d2) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d2) && (result === d3) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d3) && (result === d4) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d4) && (result === d5) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d5) && (result === d6) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d6) && (result === d7) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d7) && (result === d8) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d8) && (result === d9) && (rest === d0)) ||
            ((lhs === d1) && (rhs === d9) && (result === d0) && (rest === d1)) ||
            //lhs=2
            ((lhs === d2) && (rhs === d1) && (result === d3) && (rest === d0)) ||
            ((lhs === d2) && (rhs === d2) && (result === d4) && (rest === d0)) ||
            ((lhs === d2) && (rhs === d3) && (result === d5) && (rest === d0)) ||
            ((lhs === d2) && (rhs === d4) && (result === d6) && (rest === d0)) ||
            ((lhs === d2) && (rhs === d5) && (result === d7) && (rest === d0)) ||
            ((lhs === d2) && (rhs === d6) && (result === d8) && (rest === d0)) ||
            ((lhs === d2) && (rhs === d7) && (result === d9) && (rest === d0)) ||
            ((lhs === d2) && (rhs === d8) && (result === d0) && (rest === d1)) ||
            ((lhs === d2) && (rhs === d9) && (result === d1) && (rest === d1)) ||
            //lhs=3
            ((lhs === d3) && (rhs === d1) && (result === d4) && (rest === d0)) ||
            ((lhs === d3) && (rhs === d2) && (result === d5) && (rest === d0)) ||
            ((lhs === d3) && (rhs === d3) && (result === d6) && (rest === d0)) ||
            ((lhs === d3) && (rhs === d4) && (result === d7) && (rest === d0)) ||
            ((lhs === d3) && (rhs === d5) && (result === d8) && (rest === d0)) ||
            ((lhs === d3) && (rhs === d6) && (result === d9) && (rest === d0)) ||
            ((lhs === d3) && (rhs === d7) && (result === d0) && (rest === d1)) ||
            ((lhs === d3) && (rhs === d8) && (result === d1) && (rest === d1)) ||
            ((lhs === d3) && (rhs === d9) && (result === d2) && (rest === d1)) ||
            //lhs=4
            ((lhs === d4) && (rhs === d1) && (result === d5) && (rest === d0)) ||
            ((lhs === d4) && (rhs === d2) && (result === d6) && (rest === d0)) ||
            ((lhs === d4) && (rhs === d3) && (result === d7) && (rest === d0)) ||
            ((lhs === d4) && (rhs === d4) && (result === d8) && (rest === d0)) ||
            ((lhs === d4) && (rhs === d5) && (result === d9) && (rest === d0)) ||
            ((lhs === d4) && (rhs === d6) && (result === d0) && (rest === d1)) ||
            ((lhs === d4) && (rhs === d7) && (result === d1) && (rest === d1)) ||
            ((lhs === d4) && (rhs === d8) && (result === d2) && (rest === d1)) ||
            ((lhs === d4) && (rhs === d9) && (result === d3) && (rest === d1)) ||
            //lhs=5
            ((lhs === d5) && (rhs === d0) && (result === d5) && (rest === d0)) ||
            ((lhs === d5) && (rhs === d1) && (result === d6) && (rest === d0)) ||
            ((lhs === d5) && (rhs === d2) && (result === d7) && (rest === d0)) ||
            ((lhs === d5) && (rhs === d3) && (result === d8) && (rest === d0)) ||
            ((lhs === d5) && (rhs === d4) && (result === d9) && (rest === d0)) ||
            ((lhs === d5) && (rhs === d5) && (result === d0) && (rest === d1)) ||
            ((lhs === d5) && (rhs === d6) && (result === d1) && (rest === d1)) ||
            ((lhs === d5) && (rhs === d7) && (result === d2) && (rest === d1)) ||
            ((lhs === d5) && (rhs === d8) && (result === d3) && (rest === d1)) ||
            ((lhs === d5) && (rhs === d9) && (result === d4) && (rest === d1)) ||
            //lhs=6
            ((lhs === d6) && (rhs === d0) && (result === d6) && (rest === d0)) ||
            ((lhs === d6) && (rhs === d1) && (result === d7) && (rest === d0)) ||
            ((lhs === d6) && (rhs === d2) && (result === d8) && (rest === d0)) ||
            ((lhs === d6) && (rhs === d3) && (result === d9) && (rest === d0)) ||
            ((lhs === d6) && (rhs === d4) && (result === d0) && (rest === d1)) ||
            ((lhs === d6) && (rhs === d5) && (result === d1) && (rest === d1)) ||
            ((lhs === d6) && (rhs === d6) && (result === d2) && (rest === d1)) ||
            ((lhs === d6) && (rhs === d7) && (result === d3) && (rest === d1)) ||
            ((lhs === d6) && (rhs === d8) && (result === d4) && (rest === d1)) ||
            ((lhs === d6) && (rhs === d9) && (result === d5) && (rest === d1)) ||
            //lhs=7
            ((lhs === d7) && (rhs === d0) && (result === d7) && (rest === d0)) ||
            ((lhs === d7) && (rhs === d1) && (result === d8) && (rest === d0)) ||
            ((lhs === d7) && (rhs === d2) && (result === d9) && (rest === d0)) ||
            ((lhs === d7) && (rhs === d3) && (result === d0) && (rest === d1)) ||
            ((lhs === d7) && (rhs === d4) && (result === d1) && (rest === d1)) ||
            ((lhs === d7) && (rhs === d5) && (result === d2) && (rest === d1)) ||
            ((lhs === d7) && (rhs === d6) && (result === d3) && (rest === d1)) ||
            ((lhs === d7) && (rhs === d7) && (result === d4) && (rest === d1)) ||
            ((lhs === d7) && (rhs === d8) && (result === d5) && (rest === d1)) ||
            ((lhs === d7) && (rhs === d9) && (result === d6) && (rest === d1)) ||
            //lhs=8
            ((lhs === d8) && (rhs === d0) && (result === d8) && (rest === d0)) ||
            ((lhs === d8) && (rhs === d1) && (result === d9) && (rest === d0)) ||
            ((lhs === d8) && (rhs === d2) && (result === d0) && (rest === d1)) ||
            ((lhs === d8) && (rhs === d3) && (result === d1) && (rest === d1)) ||
            ((lhs === d8) && (rhs === d4) && (result === d2) && (rest === d1)) ||
            ((lhs === d8) && (rhs === d5) && (result === d3) && (rest === d1)) ||
            ((lhs === d8) && (rhs === d6) && (result === d4) && (rest === d1)) ||
            ((lhs === d8) && (rhs === d7) && (result === d5) && (rest === d1)) ||
            ((lhs === d8) && (rhs === d8) && (result === d6) && (rest === d1)) ||
            ((lhs === d8) && (rhs === d9) && (result === d7) && (rest === d1)) ||
            //lhs=9
            ((lhs === d9) && (rhs === d0) && (result === d9) && (rest === d0)) ||
            ((lhs === d9) && (rhs === d1) && (result === d0) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d2) && (result === d1) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d3) && (result === d2) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d4) && (result === d3) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d5) && (result === d4) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d6) && (result === d5) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d7) && (result === d6) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d8) && (result === d7) && (rest === d1)) ||
            ((lhs === d9) && (rhs === d9) && (result === d8) && (rest === d1))
}

//Cette fonction inverse une liste

func reverse(_ list: Term, _ reversed: Term) -> Goal
{
    return reverseAcc(list, List.empty, reversed)
}

func reverseAcc(_ list: Term, _ acc: Term, _ reversed: Term) -> Goal
{
    return (list === List.empty && reversed === acc) ||
        freshn{ t in
            let head = t ["head"]
            let tail = t ["tail"]
            return list === List.cons (head, tail) && delayed(reverseAcc (tail, List.cons (head, acc), reversed))
    }
}

//Interdiction d'avoir un 0 au début d'une liste
func notZero(_ term : Term) -> Goal
{
    var goal : Goal = (term === Value(1))
    for i in 2...9 {
        goal = goal || (term === Value(i))
    }
    return goal
}

// Evaluation:
func evalBoolean (input: Term, output: Term) -> Goal {
  return

      //cas basiques

      (input === t && output === t) || (input === f && output === f) ||



          (freshn { g in
              let l  = g ["l"]
              let r  = g ["r"]
              let lv = g ["lv"]
              let rv = g ["rv"]
              return input === and (l, r) &&
                  evalBoolean (input: l, output: lv) &&
                  evalBoolean (input: r, output: rv) &&
                  ((lv === t && output === rv) || (lv === f && output === f))
          }) ||

          (freshn { g in
              let l  = g ["l"]
              let r  = g ["r"]
              let lv = g ["lv"]
              let rv = g ["rv"]
              return input === or (l, r) &&
                  evalBoolean (input: l, output: lv) &&
                  evalBoolean (input: r, output: rv) &&
                  ((lv === f && output === rv) || (lv === t && output === t))
          }) ||

          (freshn { g in
              let l  = g ["l"]
              let r  = g ["r"]
              let lv = g ["lv"]
              let rv = g ["rv"]
              return input === implies (l, r) &&
                  evalBoolean (input: l, output: lv) &&
                  evalBoolean (input: r, output: rv) &&
                  ((lv === t && output === rv) || (lv === f && output === t))
          })
          ||


          (
              freshn { g in
                  let r  = g ["r"]
                  let rv = g ["rv"]
                  return input === not(r) &&
                      evalBoolean(input: r, output: rv) &&
                      ((rv === f && output === t) || (rv === t && output === f))
              }
  )
}


func evalAdd(_ lhs : Term,_ rhs : Term,_ result : Term) -> Goal {
    return
        freshn { t in
            let lhs_inversed = t ["lhs_inversed"]
            let rhs_inversed = t ["rhs_inversed"]
            let result_inversed = t ["result_inversed"]
            return reverse(lhs, lhs_inversed) && reverse(rhs, rhs_inversed) &&
                evalAddSecond(lhs_inversed, rhs_inversed, result_inversed) &&
                reverse(result_inversed, result)
    }
}

func evalAddSecond(_ lhs_inversed : Term,_ rhs_inversed : Term,_ result_inversed : Term) -> Goal {
    return lhs_inversed === List.empty && rhs_inversed === result_inversed ||
        rhs_inversed === List.empty && lhs_inversed === result_inversed ||
        delayed(freshn { t in
            let lhead = t ["lhead"]
            let ltail = t ["ltail"]
            let rhead = t ["rhead"]
            let rtail = t ["rtail"]
            let restail = t ["restail"]
            let reshead = t ["reshead"]
            let temp = t ["temp"]
            return
                lhs_inversed === List.cons(lhead,ltail) &&
                    rhs_inversed === List.cons(rhead,rtail) &&
                    result_inversed === List.cons(restail,reshead) &&
                    (addDigit(lhead, rhead, restail, d0) && evalAddSecond(ltail, rtail, reshead) ||
                        (addDigit(lhead, rhead, restail, d1) && evalAddSecond(ltail, rtail, temp) && evalAddSecond(temp, toNumber(1), reshead)))
        })
}


func evalMinus(_ lhs : Term,_ rhs : Term,_ result : Term) -> Goal {
    return
        delayed(freshn { t in
            let head = t ["head"]
            let tail = t ["tail"]
            let lhs_inversed = t ["lhs_inversed"]
            let rhs_inversed = t ["rhs_inversed"]
            let result_inversed = t ["result_inversed"]

            return
                reverse(lhs, lhs_inversed) &&
                reverse(rhs, rhs_inversed) &&
                evalAddSecond(result_inversed, rhs_inversed, lhs_inversed) &&
                reverse(result_inversed, result) &&
                result === List.cons(head, tail) && notZero(head)
        })
}

func evalMul (_ lhs : Term,_ rhs : Term,_ result : Term) -> Goal {

    return (rhs === toNumber(1) && lhs === result ) ||
            delayed(freshn { t in
                let decrement = t ["decrement"]
                let temp = t ["temp"]
                return
                    evalMinus(rhs, toNumber(1), decrement) &&
                    evalMul(lhs, decrement, temp) &&
                    evalAdd(temp, lhs, result)
                })
}


func evalDiv (_ lhs : Term,_ rhs : Term,_ result : Term) -> Goal {
    return evalMul(rhs, result, lhs)
}


func compare(_ lhs : Term,_ rhs : Term,_ op: String) -> Goal {
    var goal : Goal = (t === f)
    for i in 0...9 {
        for j in 0...9 {
            switch op {
            case "eq":
                if i == j {
                    goal = goal || (lhs === Value(i) && rhs === Value(j))
                }
            case "ne":
                if i != j {
                    goal = goal || (lhs === Value(i) && rhs === Value(j))
                }
            case "le":
                if i <= j {
                    goal = goal || (lhs === Value(i) && rhs === Value(j))
                }
            case "lt":
                if i < j {
                    goal = goal || (lhs === Value(i) && rhs === Value(j))
                }
            case "ge":
                if i >= j {
                    goal = goal || (lhs === Value(i) && rhs === Value(j))
                }
            case "gt":
                if i > j {
                    goal = goal || (lhs === Value(i) && rhs === Value(j))
                }
            default:
                print("Stop Error")
            }
        }
    }

    return goal
}


func evalEqual (_ lhs: Term, _ rhs: Term) -> Goal {
    return (lhs === List.empty && rhs === List.empty) ||
        freshn { t in
            let lhead = t["lhead"]
            let ltail = t["ltail"]
            let rhead = t["rhead"]
            let rtail = t["rtail"]
            return lhs === List.cons(lhead, ltail) && rhs === List.cons(rhead, rtail) && compare(lhead, rhead, "eq") && evalEqual(ltail, rtail)
    }
}


func evalNotEqual (_ lhs: Term, _ rhs: Term) -> Goal {
    return freshn { t in
        let lhead = t["lhead"]
        let ltail = t["ltail"]
        let rhead = t["rhead"]
        let rtail = t["rtail"]
        return (lhs === List.empty && rhs === List.cons(lhead, ltail)) ||
               (rhs === List.empty && lhs === List.cons(lhead, ltail)) ||
               (lhs === List.cons(lhead, ltail) && rhs === List.cons(rhead, rtail) && (compare(lhead, rhead, "ne") || evalNotEqual(ltail, rtail)))
    }
}


func evalLessThan(_ lhs : Term,_ rhs : Term) -> Goal {
    return freshn { t in
        let lhead = t["lhead"]
        let ltail = t["ltail"]
        let rhead = t["rhead"]
        let rtail = t["rtail"]
        return (lhs === List.empty && rhs === List.cons(lhead,ltail)) ||
                compare(lhs, rhs, "lt") ||
                ((lhs === List.cons(lhead, ltail) && rhs === List.cons(rhead, rtail)) &&
                ((compare(lhead, rhead, "lt") && (evalEqual(ltail, rtail) || evalLessThan(ltail, rtail))) ||
                (compare(lhead, rhead, "ge") && evalLessThan(ltail, rtail))))
    }
}


func evalGreaterThan(_ lhs : Term,_ rhs : Term) -> Goal {
    return freshn { t in
        let lhead = t["lhead"]
        let ltail = t["ltail"]
        let rhead = t["rhead"]
        let rtail = t["rtail"]
        return (rhs === List.empty && lhs === List.cons(lhead,ltail)) ||
                compare(lhs, rhs, "gt") ||
                ((lhs === List.cons(lhead, ltail) && rhs === List.cons(rhead, rtail)) &&
                ((compare(lhead, rhead, "gt") && (evalEqual(ltail, rtail) || evalGreaterThan(ltail, rtail))) ||
                (compare(lhead, rhead, "le") && evalGreaterThan(ltail, rtail))))
    }
}


func evalGreaterEqual(_ lhs : Term,_ rhs : Term) -> Goal {
    return evalGreaterThan(lhs, rhs) || evalEqual(lhs, rhs)
}


func evalLessEqual(_ lhs : Term,_ rhs : Term) -> Goal {
    return evalLessThan(lhs, rhs) || evalEqual(lhs, rhs)
}

func evalComparison (_ input: Term, _ result: Term) -> Goal {
  return freshn
    { t in
        let lhs = t["lhs"]
        let rhs = t["rhs"]
        let lhs_inverted = t["lhs_inverted"]
        let rhs_inverted = t["rhs_inverted"]
        return  (input === equal(lhs, rhs) && (reverse(lhs, lhs_inverted) && reverse(rhs, rhs_inverted)) &&
                ((evalEqual(lhs_inverted, rhs_inverted) && result === Value(true)) || (evalNotEqual(lhs_inverted, rhs_inverted) && result === Value(false))))
                ||
                (input === notequal(lhs, rhs) && (reverse(lhs, lhs_inverted) && reverse(rhs, rhs_inverted)) &&
                ((evalNotEqual(lhs_inverted, rhs_inverted) && result === Value(true)) || (evalEqual(lhs_inverted, rhs_inverted) && result === Value(false))))
                ||
                (input === lessthan(lhs, rhs) && (reverse(lhs, lhs_inverted) && reverse(rhs, rhs_inverted)) && ((evalLessThan(lhs_inverted, rhs_inverted) && // LessThan
                result === Value(true)) || (evalGreaterEqual(lhs_inverted, rhs_inverted) && result === Value(false))))
                ||
                (input === lessequal(lhs, rhs) && (reverse(lhs, lhs_inverted) && reverse(rhs, rhs_inverted)) && ((evalLessEqual(lhs_inverted, rhs_inverted) && // LessEqual
                result === Value(true)) || (evalGreaterThan(lhs_inverted, rhs_inverted) && result === Value(false))))
                ||
                (input === greaterthan(lhs, rhs) && (reverse(lhs, lhs_inverted) && reverse(rhs, rhs_inverted)) &&  // Greater than
                ((evalGreaterThan(lhs_inverted, rhs_inverted) && result === Value(true)) || (evalLessEqual(lhs_inverted, rhs_inverted) &&
                result === Value(false))))
                ||
                (input === greaterequal(lhs, rhs) && (reverse(lhs, lhs_inverted) && reverse(rhs, rhs_inverted)) && // Greater or equal
                ((evalGreaterEqual(lhs_inverted, rhs_inverted) && result === Value(true)) ||
                (evalLessThan(lhs_inverted, rhs_inverted) && result === Value(false))))
    }
}

// Main evaluation:

func eval (input: Term, output: Term) -> Goal {
  return evalBoolean(input: input, output: output) || evalComparison(input, output) ||
          delayed( freshn { t in
              let term1 = t ["term1"]
              let out1 = t ["out1"]
              let term2 = t ["term2"]
              let out2 = t ["out2"]
              return (input === implies(term1, term2) && eval(input: term1,output: out1) &&
                      eval(input: term2,output: out2) && evalBoolean(input: implies(out1, out2), output: output)) ||

                      (input === and(term1, term2) && eval(input: term1,output: out1) &&
                      eval(input: term2,output: out2) && evalBoolean(input: and(out1, out2), output: output)) ||

                      (input === or(term1, term2) && eval(input: term1,output: out1) &&
                      eval(input: term2,output: out2) && evalBoolean(input: or(out1, out2), output: output)) ||

                      (input === not(term1) && eval(input: term1,output: out1) &&
                      evalBoolean(input: not(out1), output: output))
              }
  )
}
