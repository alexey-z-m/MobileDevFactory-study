import UIKit

enum FuelType: String {
    case petrol
    case gas
    case diesel
}

class Vehicle {
    var drivers: Int
    var passangers: Int
    var owner: String
    
    init(owner: String, drivers: Int, passangers: Int) {
        self.drivers = drivers
        self.passangers = passangers
        self.owner = owner
    }
}

var car = Vehicle(owner: "My Father", drivers: 1, passangers: 4)
var bicycle = Vehicle(owner: "My son", drivers: 1, passangers: 0)
var plane = Vehicle(owner: "Aeroflot", drivers: 2, passangers: 40)

class Car: Vehicle {
    let model: String
    var color: String
    let fuelType: FuelType
    
    init(owner: String, drivers: Int, passangers: Int, model: String, color: String, fuelType: FuelType) {
        self.model = model
        self.color = color
        self.fuelType = fuelType
        super.init(owner: owner, drivers: drivers, passangers: passangers)
    }
}

var storyCar = Car(owner: car.owner, drivers: car.drivers, passangers: car.passangers, model: "Kia Rio", color: "red", fuelType: FuelType.gas)

class Bicycle: Vehicle {
    let model: String
    var color: String
    let wheelsCount: Int
    
    init(owner: String, drivers: Int, passangers: Int, model: String, color: String, wheelsCount: Int) {
        self.model = model
        self.color = color
        self.wheelsCount = wheelsCount
        super.init(owner: owner, drivers: drivers, passangers: passangers)
    }
}

var storyBike = Bicycle(owner: bicycle.owner, drivers: bicycle.drivers, passangers: bicycle.passangers, model: "Stels", color: "blue", wheelsCount: 4)

class Plane: Vehicle {
    let model: String
    let maxSpeed: Double
    let length: Double
    
    init(owner: String, drivers: Int, passangers: Int, model: String, maxSpeed: Double, length: Double) {
        self.model = model
        self.maxSpeed = maxSpeed
        self.length = length
        super.init(owner: owner, drivers: drivers, passangers: passangers)
    }
}

var storyPlane = Plane(owner: plane.owner, drivers: plane.drivers, passangers: plane.passangers, model: "Boing666", maxSpeed: 945, length: 42)

print("""
    \(storyCar.owner) has a \(storyCar.color) car - \(storyCar.model). It runs on \(storyCar.fuelType).
    \(storyBike.owner) rides a \(storyBike.color) \(storyBike.wheelsCount)-wheels bicycle model "\(storyBike.model)".
    \(storyPlane.owner) has a plane: a \(storyPlane.model), it is \(storyPlane.length) meters long and its maximum speed is \(storyPlane.maxSpeed) km/h.

""")

func findShort(_ string: String) -> Int {
    var array: [Int]
    array = string.split(separator: " ").map({String($0).count})
    array.sort()
    return array.first ?? 0
}
let sentence = "The quick brown fox jumps over the lazy dog."
print("shortest \(findShort(sentence)) letter word")
