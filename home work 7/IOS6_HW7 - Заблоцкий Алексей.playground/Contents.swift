import UIKit
let countТravelers = 2
print("Кол-во человек в поездке:\(countТravelers)")

var sumDistance = [Double]()
var spendFuelAll = [Double]()
var spendMoneyCar = [Double]()
var spendMoneyPlane = [Double]()
var spendMoneyOnStay = [Double]()
var spendMoneyAll: Double = 0

struct City {
    let name: String
    let populatuion: Int
    let discription: String
}

class Car {
    let model: String
    let fuelСonsumption: Double
    init(model: String, fuelСonsumption: Double) {
        self.model = model
        self.fuelСonsumption = fuelСonsumption
    }
}

struct Hotel {
    let name: String
    let priceOneNight: Double
    let dayToStay: Int
    
    func getCostToStay() -> Double {
        Double(self.dayToStay)  * self.priceOneNight
    }
}

struct TripInfo {
    let countТravelers: Int
    var departure: City
    let destinationCity: City
    let distanceByPlane: Double
    let distanceByCar: Double
    let priceFly: Double
    let car: Car?
    let hotel: Hotel
    
    static var fuelPrice = 55.5
    static var route = ""
    
    func printAboutCity() {
        print("\(destinationCity.name) (население:\(destinationCity.populatuion)). \(destinationCity.discription)")
    }
    
    func getSpendFuel() -> Double {
        var result = 0.0
        if let car = self.car {
            result = self.distanceByCar / 100 * car.fuelСonsumption
        }
        return result
    }
    
    func getCostOnCar() -> Double {
        getSpendFuel() * TripInfo.fuelPrice
    }
    
    func getCostOnPlane(countТravelers: Int) -> Double {
        self.priceFly * Double(countТravelers)
    }
    
    mutating func printTravelRoute(from departure: inout City, to destinationCity: City) {
        TripInfo.route += ", " + destination.name
        print("* \(departure.name) - \(destinationCity.name)")
        departure = destinationCity
    }
    
    func printAll() {
        printAboutCity()
        var routeData = ""
        if let car = self.car {
            routeData += """
                    Расстояние на 🚗(\(car.model)): \(String(format: "%.2f", self.distanceByCar)) км.
                    Стоимость на машине: \(String(format: "%.2f", getCostOnCar())) руб.
                    Потрачно литров: \(String(format: "%.2f", getSpendFuel())) л.\n
                """
        } else {
            routeData += """
                    Расстояние на ✈️: \(String(format: "%.2f", self.distanceByPlane)) км.
                    Цена билета: \(String(format: "%.2f", self.priceFly)) руб.
                    Стоимость перелета: \(String(format: "%.2f", getCostOnPlane(countТravelers: self.countТravelers))) руб.\n
                """
        }
        routeData += "    Стоимость проживания: \(String(format: "%.2f", hotel.getCostToStay())) руб.\n"
        print(routeData)
    }
    
    func calculateSummaryInfo () {
        if self.car != nil {
            sumDistance.append(self.distanceByCar)
            spendMoneyCar.append(self.getCostOnCar())
            spendMoneyPlane.append(0.0)
        } else {
            sumDistance.append(self.distanceByPlane)
            spendMoneyCar.append(0.0);
            spendMoneyPlane.append(self.getCostOnPlane(countТravelers: self.countТravelers))
        }
        spendFuelAll.append(self.getSpendFuel())
        spendMoneyOnStay.append(self.hotel.getCostToStay())
        spendMoneyAll = spendMoneyCar.reduce(0, +) + spendMoneyOnStay.reduce(0, +) + spendMoneyPlane.reduce(0, +)
    }
    
    static func printSummaryInfo() {
        let result =
        """
        Итог:
            Преодолено: \(sumDistance.map({round($0)}).reduce(0, +)) км.
            Потрачено топлива: \(spendFuelAll.map({round($0)}).reduce(0, +)) л.
            Потрачено на топливо: \(spendMoneyCar.map({round($0)}).reduce(0, +)) руб.
            Потрачено на билеты: \(spendMoneyPlane.map({round($0)}).reduce(0, +)) руб.
            Потрачено на проживание: \(spendMoneyOnStay.map({round($0)}).reduce(0, +)) руб.
                ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.

        Маршрут путешествия: \(route)
        """
        print(result)
    }
}

var departure = City(name: "Архангельск", populatuion: 666, discription: "Столица Севера")
TripInfo.route = departure.name
var destination = City(name: "Санкт-Петербург", populatuion: 666, discription: "Культурная столица России")
var car: Car? = Car(model: "Volkswagen", fuelСonsumption: 7.2)
var hotel = Hotel(name: "Park Inn", priceOneNight: 5000, dayToStay: 3)
var tripInfo = TripInfo(
    countТravelers: countТravelers,
    departure: departure,
    destinationCity: destination,
    distanceByPlane: 735,
    distanceByCar: 1109,
    priceFly: 5500,
    car: car,
    hotel: hotel)
tripInfo.printTravelRoute(from: &departure, to: destination)
tripInfo.calculateSummaryInfo()
tripInfo.printAll()

destination = City(name: "Хельсинки", populatuion: 777, discription: "Столица Финляндии")
car = nil
hotel = Hotel(name: "Park Inn", priceOneNight: 5000, dayToStay: 3)
tripInfo = TripInfo(
    countТravelers: countТravelers,
    departure: departure,
    destinationCity: destination,
    distanceByPlane: 299.0,
    distanceByCar: 381.0,
    priceFly: 4500.0,
    car: car,
    hotel: hotel)
tripInfo.printTravelRoute(from: &departure, to: destination)
tripInfo.calculateSummaryInfo()
tripInfo.printAll()

destination = City(name: "Барселона", populatuion: 666, discription: "Столица Каталонии")
car = Car(model: "Fiat", fuelСonsumption: 6.7)
hotel = Hotel(name: "Park Inn", priceOneNight: 5000, dayToStay: 3)
tripInfo = TripInfo(
    countТravelers: countТravelers,
    departure: departure,
    destinationCity: destination,
    distanceByPlane: 2_606,
    distanceByCar: 3_425,
    priceFly: 18_702,
    car: car,
    hotel: hotel)
tripInfo.printTravelRoute(from: &departure, to: destination)
tripInfo.calculateSummaryInfo()
tripInfo.printAll()

destination = City(name: "Минск", populatuion: 666, discription: "Столица Беларуси")
car = Car(model: "Opel", fuelСonsumption: 8)
hotel = Hotel(name: "Park Inn", priceOneNight: 5000, dayToStay: 3)
tripInfo = TripInfo(
    countТravelers: countТravelers,
    departure: departure,
    destinationCity: destination,
    distanceByPlane: 2338,
    distanceByCar: 2912,
    priceFly: 18702,
    car: car,
    hotel: hotel)
tripInfo.printTravelRoute(from: &departure, to: destination)
tripInfo.calculateSummaryInfo()
tripInfo.printAll()

destination = City(name: "Москва", populatuion: 666, discription: "Столица России")
car = Car(model: "Hyundai", fuelСonsumption: 7.7)
hotel = Hotel(name: "Park Inn", priceOneNight: 5000, dayToStay: 3)
tripInfo = TripInfo(
    countТravelers: countТravelers,
    departure: departure,
    destinationCity: destination,
    distanceByPlane: 676,
    distanceByCar: 718,
    priceFly: 7500,
    car: car,
    hotel: hotel)
tripInfo.printTravelRoute(from: &departure, to: destination)
tripInfo.calculateSummaryInfo()
tripInfo.printAll()

destination = City(name: "Ярославль", populatuion: 666, discription: "Это город в России")
car = Car(model: "Toyota", fuelСonsumption: 8.2)
hotel = Hotel(name: "Park Inn", priceOneNight: 5000, dayToStay: 3)
tripInfo = TripInfo(
    countТravelers: countТravelers,
    departure: departure,
    destinationCity: destination,
    distanceByPlane: 251,
    distanceByCar: 275,
    priceFly: 3000,
    car: car,
    hotel: hotel)
tripInfo.printTravelRoute(from: &departure, to: destination)
tripInfo.calculateSummaryInfo()
tripInfo.printAll()

destination = City(name: "Архангельск", populatuion: 666, discription: "Столица Севера")
car = nil
hotel = Hotel(name: "Park Inn", priceOneNight: 5000, dayToStay: 3)
tripInfo = TripInfo(
    countТravelers: countТravelers,
    departure: departure,
    destinationCity: destination,
    distanceByPlane: 771,
    distanceByCar: 971,
    priceFly: 11949,
    car: car,
    hotel: hotel)
tripInfo.printTravelRoute(from: &departure, to: destination)
tripInfo.calculateSummaryInfo()
tripInfo.printAll()

TripInfo.printSummaryInfo()

func calculate (n: Int) -> Int {
    var result = 0
    var m = n - 1
    while m > 0 {
        if m % 3 == 0 || m % 5 == 0 {
            result += m
        }
        m -= 1
    }
    return result
}
print(calculate(n: 10))
