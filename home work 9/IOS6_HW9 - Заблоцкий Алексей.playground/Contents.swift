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
    
    static func getRandomCar() -> Porsche{
        return Porsche(model: "911" , year: Int.random(in: 2018...2022), accessories: [Accessories.allCases.randomElement()!], engineType: EngineType.allCases.randomElement()!, price: Double.random(in: 50_000...150_000))
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
    
    static func getRandomCar() -> Toyota{
        return Toyota(model: "Rav4" , year: Int.random(in: 2018...2022), accessories: [Accessories.allCases.randomElement()!], engineType: EngineType.allCases.randomElement()!, price: Double.random(in: 30_000...60_000))
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
    
    static func getRandomCar() -> BMW{
        return BMW(model: "x5" , year: Int.random(in: 2018...2022), accessories: [Accessories.allCases.randomElement()!], engineType: EngineType.allCases.randomElement()!, price: Double.random(in: 50_000...100_000))
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
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) отправлен на предпродажную подготовкую.")
    }
    
    func addToShowroom(car: Car) {
        if showroomCars.count < showroomCapacity {
            if carOnService.contains(where: { $0.vin == car.vin }) {
                showroomCars.append(car)
                stockCars.removeAll(where: { $0.vin == car.vin })
                print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) прошел предпродажную подготовкую и отправлен в салон.")
            }
            else {
                print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) не проходил предпродажную подготовкую и не может быть отправлен в салон.")
            }
        }
    }
    
    func sellCar(car: Car) {
        if carOnService.contains(where: { $0.vin == car.vin }) {
            print("У автомобиля пройдена предпрожадная подготовка. Автомобиль готов к продаже.")
        } else {
            print("У автомобиля НЕ пройдена предпрожадная подготовка. Выберите другой автомобиль.")
            return
        }
        
        if car.accessories.count == 0 {
            offerAccessories(accessories: Accessories.allCases)
        }
        
        showroomCars.removeAll(where: { $0.vin == car.vin })
        cars.removeAll(where: { $0.vin == car.vin })
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) успешно продан.")
    }
    
    func orderCar() {
        let car = Porsche.getRandomCar()
        stockCars.append(car)
        cars.append(car)
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) заказан и отправлен на парковку.")
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
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) отправлен на предпродажную подготовкую.")
    }
    
    func addToShowroom(car: Car) {
        if showroomCars.count < showroomCapacity {
            if carOnService.contains(where: { $0.vin == car.vin }) {
                showroomCars.append(car)
                stockCars.removeAll(where: { $0.vin == car.vin })
                print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) прошел предпродажную подготовкую и отправлен в салон.")
            }
            else {
                print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) не проходил предпродажную подготовкую и не может быть отправлен в салон.")
            }
        }
    }
    
    func sellCar(car: Car) {
        if carOnService.contains(where: { $0.vin == car.vin }) {
            print("У автомобиля пройдена предпрожадная подготовка. Автомобиль готов к продаже.")
        } else {
            print("У автомобиля НЕ пройдена предпрожадная подготовка. Выберите другой автомобиль.")
            return
        }
        
        if car.accessories.count == 0 {
            offerAccessories(accessories: Accessories.allCases)
        }
        
        showroomCars.removeAll(where: { $0.vin == car.vin })
        cars.removeAll(where: { $0.vin == car.vin })
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) успешно продан.")
    }
    
    func orderCar() {
        let car = BMW.getRandomCar()
        stockCars.append(car)
        cars.append(car)
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) заказан и отправлен на парковку.")
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
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) отправлен на предпродажную подготовкую.")
    }
    
    func addToShowroom(car: Car) {
        if showroomCars.count < showroomCapacity {
            if carOnService.contains(where: { $0.vin == car.vin }) {
                showroomCars.append(car)
                stockCars.removeAll(where: { $0.vin == car.vin })
                print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) прошел предпродажную подготовкую и отправлен в салон.")
            }
            else {
                print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) не проходил предпродажную подготовкую и не может быть отправлен в салон.")
            }
        }
    }
    
    func sellCar(car: Car) {
        if carOnService.contains(where: { $0.vin == car.vin }) {
            print("У автомобиля пройдена предпрожадная подготовка. Автомобиль готов к продаже.")
        } else {
            print("У автомобиля НЕ пройдена предпрожадная подготовка. Выберите другой автомобиль.")
            return
        }
        
        if car.accessories.count == 0 {
            offerAccessories(accessories: Accessories.allCases)
        }
        
        showroomCars.removeAll(where: { $0.vin == car.vin })
        cars.removeAll(where: { $0.vin == car.vin })
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) успешно продан.")
    }
    
    func orderCar() {
        let car = Toyota.getRandomCar()
        stockCars.append(car)
        cars.append(car)
        print("Автомобиль \(car.brand) \(car.model) год:\(car.year) vin:\(car.vin) заказан и отправлен на парковку.")
    }
}


let porsche = Porsche(model: "Taycan", year: 2020, accessories: [], engineType: .petrol, price: 100_000)
let toyota = Toyota(model: "Rav4", year: 2020, accessories: [.сarpets], engineType: .electric, price: 40_000)
let bmw = Toyota(model: "x5", year: 2020, accessories: [.firstAidKit], engineType: .diesel, price: 60_000)


let porscheDealer = PorscheDealership(showroomCapacity: 5, stockCars: [], showroomCars: [], cars: [])
let bmwDealer = BMWDealership(showroomCapacity: 20, stockCars: [], showroomCars: [], cars: [])
let toyotaDealer = ToyotaDealership(showroomCapacity: 10, stockCars: [], showroomCars: [], cars: [])

let array = [porscheDealer as Dealership, bmwDealer, toyotaDealer]

array.forEach {
    print($0.tagline)
}

for _ in 0...30 {
    porscheDealer.orderCar()
}

porscheDealer.offerAccessories(accessories: Accessories.allCases)
porscheDealer.cars.forEach {
    porscheDealer.presaleService(car: $0)
}
porscheDealer.cars.forEach {
    porscheDealer.addToShowroom(car: $0)
}
//porscheDealer.addToShowroom(car: porscheDealer.cars.last!)
porscheDealer.showroomCars
//porscheDealer.sellCar(car: porscheDealer.showroomCars.last!)
porscheDealer.cars
porscheDealer.showroomCars


protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer() throws
}

enum SpecialOfferError: Error {
    case fullShowroom
}

extension PorscheDealership: SpecialOffer {
    func addEmergencyPack() {
        for i in 0...(self.cars.count-1) {
            if !self.cars[i].accessories.contains(where: {$0 == .extinguisher}) {
                self.cars[i].accessories.append(.extinguisher)
            }
            
            if !self.cars[i].accessories.contains(where: {$0 == .firstAidKit}) {
                self.cars[i].accessories.append(.firstAidKit)
            }
        }
    }
    
    func makeSpecialOffer() throws {
        let year: Int = Int(Date.now.formatted(.dateTime.year())) ?? 1900
        if self.stockCars.count > 0 {
            for i in 0...(self.stockCars.count-1) {
                if self.stockCars[i].year < year  && !self.carOnSaleVin.contains(where: {$0 == self.stockCars[i].vin}) {
                    self.stockCars[i].price = self.stockCars[i].price - self.stockCars[i].price * 0.15
                    self.carOnSaleVin.insert(self.stockCars[i].vin)
                    
                    if !self.stockCars[i].accessories.contains(where: {$0 == .extinguisher}) {
                        self.stockCars[i].accessories.append(.extinguisher)
                    }
                    
                    if !self.stockCars[i].accessories.contains(where: {$0 == .firstAidKit}) {
                        self.stockCars[i].accessories.append(.firstAidKit)
                    }
                    if self.showroomCars.count < self.showroomCapacity {
                        self.showroomCars.append(self.stockCars[i])
                    } else {
                        throw SpecialOfferError.fullShowroom
                    }
                    print("Автомобиль \(self.stockCars[i].brand) \(self.stockCars[i].model) год:\(self.stockCars[i].year) vin:\(self.stockCars[i].vin) находящийся в на парковке получил SpecialOffer")
                }
            }
        }
        if self.showroomCars.count > 0 {
            for i in 0...(self.showroomCars.count-1) {
                if self.showroomCars[i].year < year  && !self.carOnSaleVin.contains(where: {$0 == self.showroomCars[i].vin}) {
                    self.showroomCars[i].price = self.showroomCars[i].price - self.showroomCars[i].price * 0.15
                    self.carOnSaleVin.insert(self.showroomCars[i].vin)
                    
                    if !self.showroomCars[i].accessories.contains(where: {$0 == .extinguisher}) {
                        self.showroomCars[i].accessories.append(.extinguisher)
                    }
                    
                    if !self.showroomCars[i].accessories.contains(where: {$0 == .firstAidKit}) {
                        self.showroomCars[i].accessories.append(.firstAidKit)
                    }
                    
                    print("Автомобиль \(self.showroomCars[i].brand) \(self.showroomCars[i].model) год:\(self.showroomCars[i].year) vin:\(self.showroomCars[i].vin) находящийся в автосалоне получил SpecialOffer")
                }
            }
        }
    }
}

porscheDealer.addEmergencyPack()
do {
    try porscheDealer.makeSpecialOffer()
} catch SpecialOfferError.fullShowroom {
    print("Невозможно отправить автомобиль в автосалон. Автосалон полон.")
}
