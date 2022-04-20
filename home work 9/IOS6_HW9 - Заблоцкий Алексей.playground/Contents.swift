import Foundation
struct Vin {
    static var vins = Set<String>()
    static func randomVin() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let vin = String((0..<6).map{ _ in letters.randomElement()! })
        if Vin.vins.insert(vin).inserted {
            return vin
        } else {
            return randomVin()
        }
    }
}

enum EngineType: CaseIterable {
    case diesel
    case petrol
    case electric
}

enum Accessories: String, CaseIterable {
    case firstAidKit = "First Aid Kit"
    case extinguisher = "Fire extinguisher"
    case сarpets = "Car сarpets"
}

protocol Car {
    var vin: String { get }
    var brand: String { get }
    var model: String { get }
    var year: Int { get }
    
    var accessories: [Accessories] { get set }
    var engineType: EngineType { get }
    var price: Double { get set }
    
    func startEngine()
}

protocol Dealership {
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Car] { get set }
    var showroomCars: [Car] { get set }
    var cars: [Car] { get set }
    var tagline: String { get set }
    
    var carOnService: [Car] { get set }
    var carOnSaleVin: Set<String> { get set }
    var carOnInspection: Car? { get }
    
    func offerAccessories(accessories: [Accessories])
    func presaleService(car: Car)
    func addToShowroom(car: Car)
    func sellCar(car: Car)
    func orderCar()
}

struct Porsche: Car {
    let vin: String = Vin.randomVin()
    let brand = "Porsche"
    let model: String
    let year: Int
    var accessories: [Accessories]
    var engineType: EngineType
    var price: Double
    
    func startEngine() {
        print("I'm \(brand) \(model). My \(engineType) engine was starting.")
    }
    
    enum Model: String, CaseIterable {
        case nineEleven = "911"
        case macan = "Macan"
        case taycan = "Taycan"
    }
    
    static func getRandomCar() -> Porsche{
        return Porsche(model: Model.allCases.randomElement()!.rawValue,
                       year: Int.random(in: 2018...2022),
                       accessories: [Accessories.allCases.randomElement()!],
                       engineType: EngineType.allCases.randomElement()!,
                       price: Double.random(in: 50_000...150_000))
    }
}

struct Toyota: Car  {
    let vin: String = Vin.randomVin()
    let brand = "Toyota"
    let model: String
    let year: Int
    var accessories: [Accessories]
    var engineType: EngineType
    var price: Double
    
    func startEngine() {
        print("I'm \(brand) \(model). My \(engineType) engine was starting.")
    }
    
    enum Model: String, CaseIterable {
        case ravFour = "Rav4"
        case corolla = "Corolla"
        case camry = "Camry"
    }
    
    static func getRandomCar() -> Toyota{
        return Toyota(model: Model.allCases.randomElement()!.rawValue,
                      year: Int.random(in: 2018...2022),
                      accessories: [Accessories.allCases.randomElement()!],
                      engineType: EngineType.allCases.randomElement()!,
                      price: Double.random(in: 30_000...60_000))
    }
}
struct BMW: Car {
    let vin: String = Vin.randomVin()
    let brand = "BMW"
    let model: String
    let year: Int
    var accessories: [Accessories]
    var engineType: EngineType
    var price: Double
    
    func startEngine() {
        print("I'm \(brand) \(model). My \(engineType) engine was starting.")
    }
    
    enum Model: String, CaseIterable {
        case xFive = "x5"
        case xSix = "x6"
        case xSeven = "x7"
    }
    
    static func getRandomCar() -> BMW{
        return BMW(model: Model.allCases.randomElement()!.rawValue,
                   year: Int.random(in: 2018...2022),
                   accessories: [Accessories.allCases.randomElement()!],
                   engineType: EngineType.allCases.randomElement()!,
                   price: Double.random(in: 50_000...100_000))
    }
}

class PorscheDealership: Dealership {
    let name: String = "Porsche dealer"
    let showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    var tagline: String = "Porsche. There is no substitute."
    
    var carOnService: [Car] = []
    var carOnSaleVin: Set<String> = []
    
    var carOnInspection: Car?
    
    init(showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    
    func offerAccessories(accessories: [Accessories]) {
        print("Recommended Accessories:")
        accessories.forEach {
            print($0.rawValue)
        }
    }
    
    func presaleService(car: Car) {
        carOnService.append(car)
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) sent to pre-sales service")
    }
    
    func addToShowroom(car: Car) {
        if showroomCars.count < showroomCapacity {
            if carOnService.contains(where: { $0.vin == car.vin }) {
                showroomCars.append(car)
                stockCars.removeAll(where: { $0.vin == car.vin })
                print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) passed the pre-sales service and sent to the showroom.")
            }
            else {
                print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) has not been pre-sales and cannot be sent to the showroom.")
            }
        }
    }
    
    func sellCar(car: Car) {
        if carOnService.contains(where: { $0.vin == car.vin }) {
            print("\nThe car has passed pre-sales service. The car is ready for sale.")
        } else {
            print("\nThe car has not been pre-sales serviced. Сhoose another car or request a pre-sales service")
            return
        }
        
        if car.accessories.count == 0 {
            offerAccessories(accessories: Accessories.allCases)
        }
        
        showroomCars.removeAll(where: { $0.vin == car.vin })
        cars.removeAll(where: { $0.vin == car.vin })
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) successfully sold.")
    }
    
    func orderCar() {
        let car = Porsche.getRandomCar()
        stockCars.append(car)
        cars.append(car)
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) is ordered and sent to the parking lot.")
    }
}

class BMWDealership: Dealership {
    let name: String = "BMW dealer"
    let showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    var tagline: String = "The Ultimate Driving Machine"
    
    var carOnService: [Car] = []
    var carOnSaleVin: Set<String> = []
    
    var carOnInspection: Car?
    
    init(showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    
    func offerAccessories(accessories: [Accessories]) {
        print("Recommended Accessories:")
        accessories.forEach {
            print($0.rawValue)
        }
    }
    
    func presaleService(car: Car) {
        carOnService.append(car)
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) sent to pre-sales service")
    }
    
    func addToShowroom(car: Car) {
        if showroomCars.count < showroomCapacity {
            if carOnService.contains(where: { $0.vin == car.vin }) {
                showroomCars.append(car)
                stockCars.removeAll(where: { $0.vin == car.vin })
                print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) passed the pre-sales service and sent to the showroom.")
            }
            else {
                print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) has not been pre-sales and cannot be sent to the showroom.")
            }
        }
    }
    
    func sellCar(car: Car) {
        if carOnService.contains(where: { $0.vin == car.vin }) {
            print("\nThe car has passed pre-sales service. The car is ready for sale.")
        } else {
            print("\nThe car has not been pre-sales serviced. Сhoose another car or request a pre-sales service")
            return
        }
        
        if car.accessories.count == 0 {
            offerAccessories(accessories: Accessories.allCases)
        }
        
        showroomCars.removeAll(where: { $0.vin == car.vin })
        cars.removeAll(where: { $0.vin == car.vin })
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) successfully sold.")
    }
    
    func orderCar() {
        let car = BMW.getRandomCar()
        stockCars.append(car)
        cars.append(car)
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) is ordered and sent to the parking lot.")
    }
}

class ToyotaDealership: Dealership {
    let name: String = "Toyota dealer"
    let showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    var tagline: String = "Let's go places."
    
    var carOnService: [Car] = []
    var carOnSaleVin: Set<String> = []
    
    var carOnInspection: Car?
    
    init(showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    
    func offerAccessories(accessories: [Accessories]) {
        print("Recommended Accessories:")
        accessories.forEach {
            print($0.rawValue)
        }
    }
    
    func presaleService(car: Car) {
        carOnService.append(car)
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) sent to pre-sales service")
    }
    
    func addToShowroom(car: Car) {
        if showroomCars.count < showroomCapacity {
            if carOnService.contains(where: { $0.vin == car.vin }) {
                showroomCars.append(car)
                stockCars.removeAll(where: { $0.vin == car.vin })
                print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) passed the pre-sales service and sent to the showroom.")
            }
            else {
                print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) has not been pre-sales and cannot be sent to the showroom.")
            }
        }
    }
    
    func sellCar(car: Car) {
        if showroomCars.contains(where: {$0.vin == car.vin}) {
            if carOnService.contains(where: { $0.vin == car.vin }) {
                print("\nThe car has passed pre-sales service. The car is ready for sale.")
            } else {
                print("\nThe car has not been pre-sales serviced. Сhoose another car or request a pre-sales service")
                return
            }
            
            if car.accessories.count == 0 {
                offerAccessories(accessories: Accessories.allCases)
            }
            
            showroomCars.removeAll(where: { $0.vin == car.vin })
            cars.removeAll(where: { $0.vin == car.vin })
            print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) successfully sold.")
        } else {
            print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) is not in the showroom.")
        }
    }
    
    func orderCar() {
        let car = Toyota.getRandomCar()
        stockCars.append(car)
        cars.append(car)
        print("Car: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) is ordered and sent to the parking lot.")
    }
}

protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer() throws
}

enum SpecialOfferError: Error {
    case fullShowroom
    case carIsOnShowroom
}

extension PorscheDealership: SpecialOffer {
    func addEmergencyPack() {
        if var car = self.carOnInspection {
            if !car.accessories.contains(where: {$0 == .extinguisher}) {
                car.accessories.append(.extinguisher)
            }
            
            if !car.accessories.contains(where: {$0 == .firstAidKit}) {
                car.accessories.append(.firstAidKit)
            }
        }
    }
    
    func makeSpecialOffer() throws {
        let year: Int = Int(Date.now.formatted(.dateTime.year() )) ?? 1900
        if var car = self.carOnInspection {
            if car.year < year  && !self.carOnSaleVin.contains(where: {$0 == car.vin}) {
                car.price = car.price - car.price * 0.15
                self.carOnSaleVin.insert(car.vin)
                        
                addEmergencyPack()
                print("\nCar: \(car.brand) \(car.model) year:\(car.year) vin:\(car.vin) received a SpecialOffer")
                
                if !self.showroomCars.contains(where: {$0.vin == car.vin}){
                    if self.showroomCars.count < self.showroomCapacity {
                        self.addToShowroom(car: car)
                    } else {
                        throw SpecialOfferError.fullShowroom
                    }
                } else {
                    throw SpecialOfferError.carIsOnShowroom
                }
                
            }
        }
    }
}

let porsche = Porsche(model: "Panamera", year: 2020, accessories: [], engineType: .petrol, price: 100_000)
let toyota = Toyota(model: "Rav4", year: 2020, accessories: [.сarpets], engineType: .electric, price: 40_000)
let bmw = BMW(model: "x5", year: 2020, accessories: [.firstAidKit], engineType: .diesel, price: 60_000)

let porscheDealer = PorscheDealership(showroomCapacity: 3, stockCars: [], showroomCars: [porsche], cars: [porsche])
let bmwDealer = BMWDealership(showroomCapacity: 5, stockCars: [], showroomCars: [], cars: [toyota])
let toyotaDealer = ToyotaDealership(showroomCapacity: 3, stockCars: [], showroomCars: [bmw], cars: [bmw])

let array = [porscheDealer as Dealership, bmwDealer, toyotaDealer]

array.forEach {
    print($0.tagline)
}

for _ in 0...4 {
    porscheDealer.orderCar()
    bmwDealer.orderCar()
    toyotaDealer.orderCar()
}

porscheDealer.cars.forEach {
    porscheDealer.presaleService(car: $0)
}

porscheDealer.cars.forEach {
    porscheDealer.addToShowroom(car: $0)
}

bmwDealer.presaleService(car: bmw)
bmwDealer.sellCar(car: bmw)


for car in porscheDealer.cars {
    porscheDealer.carOnInspection = car
    do {
        try porscheDealer.makeSpecialOffer()
    } catch SpecialOfferError.fullShowroom {
        print("It is not possible to send the car(vin:\(car.vin)) to the showroom. The showroom is full.")
    } catch SpecialOfferError.carIsOnShowroom {
        print("The car(vin:\(car.vin)) is already in the showroom.")
    }
}

for car in porscheDealer.showroomCars {
    porscheDealer.carOnInspection = car
    do {
        try porscheDealer.makeSpecialOffer()
    } catch SpecialOfferError.fullShowroom {
        print("It is not possible to send the car(vin:\(car.vin)) to the showroom. The showroom is full.")
    } catch SpecialOfferError.carIsOnShowroom {
        print("The car(vin:\(car.vin)) is already in the showroom.")
    }
}

