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
  * Initializing the empty variables for area,
  * semiperimeter, and side lengths (including squared versions)
  */
  private var area: Double = 0

  private var semiPerm: Double = 0

  private var lengthA: Double = 0

  private var lengthB: Double = 0

  private var lengthC: Double = 0

  private var lengthASquared: Double = 0

  private var lengthBSquared: Double = 0

  private var lengthCSquared: Double = 0

  private let angles: Double = 180

  private let piValue: Double = 3.14159265359

  init(_ sideA: Double, _ sideB: Double, _ sideC: Double) {
    lengthA = sideA
    lengthB = sideB
    lengthC = sideC
    lengthASquared = pow(lengthA, 2)
    lengthBSquared = pow(lengthB, 2)
    lengthCSquared = pow(lengthC, 2)
    semiPerm = (lengthA + lengthB + lengthC) / 2
  }

  func checkTriangle() -> Bool {
    let check1 = lengthA + lengthB
    let check2 = lengthB + lengthC
    let check3 = lengthC + lengthA
    return (check1 >= lengthC && check2 >= lengthA && check3 >= lengthB
      && lengthA != semiPerm && lengthB != semiPerm && lengthC != semiPerm)
  }

  func getArea() -> Double {
    let preRoot = semiPerm * (semiPerm - lengthA) * (semiPerm - lengthB)
      * (semiPerm - lengthC)
    area = sqrt(preRoot)
    let altered = String(format: "%.2f", area)
    area = Double(altered) ?? 0
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
      combinedLength = lengthASquared + lengthCSquared
      largeLength = lengthBSquared
    } else if lengthB < lengthA && lengthC < lengthA {
      combinedLength = lengthBSquared + lengthCSquared
      largeLength = lengthASquared
    } else if lengthA < lengthC && lengthB < lengthC {
      combinedLength = lengthASquared + lengthBSquared
      largeLength = lengthCSquared
    } else {
      return typeCheck
    }
    if combinedLength < largeLength {
      typeCheck = "Obtuse"
    } else if combinedLength == largeLength {
      typeCheck = "Right"
    } else if combinedLength > largeLength {
      typeCheck = "Acute"
    }
    return typeCheck
  }

  func getAngles() {
    var angleA: Double = (lengthBSquared + lengthCSquared - lengthASquared)
      / (2 * lengthB * lengthC)
    var angleB: Double = (lengthASquared + lengthCSquared - lengthBSquared)
      / (2 * lengthA * lengthC)
    angleA = acos(angleA) * (angles / piValue)
    angleB = acos(angleB) * (angles / piValue)
    let angleA2 = String(format: "%.2f", angleA)
    angleA = Double(angleA2)!
    let angleB2 = String(format: "%.2f", angleB)
    angleB = Double(angleB2)!
    let angleC2 = angles - angleA - angleB
    let angleC = String(format: "%.2f", angleC2)
    print("Angle A is", angleA, "degrees.")
    print("Angle B is", angleB, "degrees.")
    print("Angle C is", angleC, "degrees.")
  }

  func getHeights() {
    let height1 = (2 * (area / lengthA))
    let height2 = (2 * (area / lengthB))
    let height3 = (2 * (area / lengthC))
    let heightA = String(format: "Height with side length A as base is %.2f",
      height1)
    let heightB = String(format: "Height with side length B as base is %.2f",
      height2)
    let heightC = String(format: "Height with side length C as base is %.2f",
      height3)
    print(heightA)
    print(heightB)
    print(heightC)
  }

  func getInscribed() -> String {
    let inscribed = area / semiPerm
    let inscribeRadius = String(format: "The radius of the inscribed circle is %.2f", inscribed)
    return inscribeRadius
  }

  func getCircumcircle() -> String {
    var circumcircleArea: Double = (lengthA * lengthB * lengthC)
      / (4 * area)
    circumcircleArea = piValue * (pow(circumcircleArea, 2))
    let answer = String(format: "The area of the circumcircle is %.2f",
      circumcircleArea)
    return answer
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
if triangle.checkTriangle() && triangleA + triangleB + triangleC != 0 {
  print("The area of the triangle is", triangle.getArea(), "units squared.")
  print("The perimeter of the triangle is", triangle.getPerimeter(), "units.")
  print("The triangle is a(n)", triangle.getType(), "triangle.")
  triangle.getAngles()
  triangle.getHeights()
  print(triangle.getInscribed(), "units.")
  print(triangle.getCircumcircle(), "units squared.")
} else {
  print("One or more of the values were not valid,",
    "please input values for a real triangle.")
}
