/*
* The triangles program.
*
* @author Matthew Sanii
* @version 1.0
* @since 2022-01-02
*/

import Foundation

public class Triangle {

  /**
  * Initializing the empty area variable.
  */
  private var area: Double = 0

  /**
  *
  */
  private var lengthA: Double = 0

  private var lengthB: Double = 0

  private var lengthC: Double = 0

  init(_ sideA: Double, _ sideB: Double, _ sideC: Double) {
    lengthA = sideA
    lengthB = sideB
    lengthC = sideC
  }

  func checkTriangle() -> Bool {
    let check1 = lengthA + lengthB
    let check2 = lengthB + lengthC
    let check3 = lengthC + lengthA
    return (check1 >= lengthC && check2 >= lengthA && check3 >= lengthB)
  }

  func getArea() -> Double {
    let semiPerm: Double = (lengthA + lengthB + lengthC) / 2
    let preRoot = semiPerm * (semiPerm - lengthA) * (semiPerm - lengthB)
      * (semiPerm - lengthC)
    var area: Double = sqrt(preRoot)
    let altered: Int = Int(area * 100)
    area = Double(altered) / 100
    return area
  }

  func getPerimeter() -> Double {
    let perimeter: Double = lengthA + lengthB + lengthC
    return perimeter
  }

  func getType() -> String {
    var combinedLength: Double = 0
    var largeLength: Double = 0
    var typeCheck: String = "Equallateral"
    if lengthA < lengthB && lengthC < lengthB {
      combinedLength = pow(lengthA, 2) + pow(lengthC, 2)
      largeLength = pow(lengthB, 2)
    } else if lengthB < lengthA && lengthC < lengthA {
      combinedLength = pow(lengthB, 2) + pow(lengthC, 2)
      largeLength = pow(lengthA, 2)
    } else if lengthA < lengthC && lengthB < lengthC {
      combinedLength = pow(lengthA, 2) + pow(lengthB, 2)
      largeLength = pow(lengthC, 2)
    } else {
      largeLength = -1
    }
    if largeLength == -1 {
      typeCheck = "Equallateral"
    } else if combinedLength < largeLength {
      typeCheck = "Obtuse"
    } else if combinedLength == largeLength {
      typeCheck = "Right"
    } else if combinedLength > largeLength {
      typeCheck = "Acute"
    }
    return typeCheck
  }
}

print("Input first side length: ")
let sidelengthA = readLine()!
print("Input second side length: ")
let sidelengthB = readLine()!
print("Input third side length: ")
let sidelengthC = readLine()!

let triangleA = Double(sidelengthA) ?? 0
let triangleB = Double(sidelengthB) ?? 0
let triangleC = Double(sidelengthC) ?? 0
let triangle = Triangle(triangleA, triangleB, triangleC)
print(triangle.getArea())
print(triangle.getPerimeter())
print(triangle.getType())
