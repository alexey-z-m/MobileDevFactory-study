import UIKit
let countТravelers = 2
print("Кол-во путешевственников: \(countТravelers)\n")
let destination = "destination"
var sumDistance = [Double]()
var spendFuelAll = [Double]()
var spendMoneyCar = [Double]()
var spendMoneyPlane = [Double]()
var spendMoneyOnStay = [Double]()
var spendMoneyAll: Double = 0
typealias CarInfo = (model: String, fuelСonsumption: Double)?
typealias TripInfo = (distanceByPlane: Double, distanceByCar: Double, priceFly: Double, dayToStay: Int, priceOneNight: Double, car: CarInfo, fuelPrice: Double)
var departure = "Архангельск"
var route = departure
var roadData = [String: [String: [String: Double]]]()
let distanceByPlane = "distanceByPlane"
let distanceByCar = "distanceByCar"
let priceFly = "priceFly"
let dayToStay = "dayToStay"
let priceOneNight = "priceOneNight"
let fuelPrice = "fuelPrice"

var car: CarInfo = (model: "Volkswagen", fuelСonsumption: 7.2)
roadData = [
    destination: [
        "Санкт-Петербург": [
            distanceByPlane: 735.0,
            distanceByCar: 1109.0,
            priceFly: 5500.0,
            dayToStay: 3,
            priceOneNight: 2500.0,
            fuelPrice: 55.5
        ]
    ]
]
toNextDestination(roadData: roadData, car: car)

car = nil
roadData = [
    destination: [
        "Хельсинки": [
            distanceByPlane: 299.0,
            distanceByCar: 381.0,
            priceFly: 4500.0,
            dayToStay: 1,
            priceOneNight: 5000.0,
            fuelPrice: 55.5
        ]
    ]
]
toNextDestination(roadData: roadData, car: car)

car = (model: "Fiat", fuelСonsumption: 6.7)
roadData = [
    destination: [
        "Барселона": [
            distanceByPlane: 2_606.0,
            distanceByCar: 3_425.0,
            priceFly: 18702.0,
            dayToStay: 7,
            priceOneNight: 7500.0,
            fuelPrice: 55.5
        ]
    ]
]
toNextDestination(roadData: roadData, car: car)

car = (model: "Opel", fuelСonsumption: 8.0)
roadData = [
    destination: [
        "Минск": [
            distanceByPlane: 2338.0,
            distanceByCar: 2912.0,
            priceFly: 18702.0,
            dayToStay: 2,
            priceOneNight: 4000.0,
            fuelPrice: 55.5
        ]
    ]
]
toNextDestination(roadData: roadData, car: car)

car = (model: "Hyundai", fuelСonsumption: 7.7)
roadData = [
    destination: [
        "Москва": [
            distanceByPlane: 676.0,
            distanceByCar: 718.0,
            priceFly: 7497.0,
            dayToStay: 1,
            priceOneNight: 6000.0,
            fuelPrice: 55.5
        ]
    ]
]
toNextDestination(roadData: roadData, car: car)

car = (model: "Toyota", fuelСonsumption: 8.2)
roadData = [
    destination: [
        "Ярославль": [
            distanceByPlane: 251.0,
            distanceByCar: 275.0,
            priceFly: 3000.0,
            dayToStay: 1,
            priceOneNight: 2000.0,
            fuelPrice: 55.5
        ]
    ]
]
toNextDestination(roadData: roadData, car: car)

car = nil
roadData = [
    destination: [
        "Архангельск": [
            distanceByPlane: 771.0,
            distanceByCar: 971.0,
            priceFly: 11949.0,
            dayToStay: 0,
            priceOneNight: 0.0,
            fuelPrice: 55.5
        ]
    ]
]
toNextDestination(roadData: roadData, car: car)

func toNextDestination(roadData: [String: [String: [String: Double]]], car: CarInfo ) {
    if let road = roadData.first?.value {
        printTravelRoute(from: &departure, to: road.first?.key ?? "")
        if let info = road.first?.value {
            printTravelDetails(car: car, info: info, travelDetails: getTravelDetails(info: info, car: car))
            calculateSummaryInfo(car: car, info: info, travelDetails: getTravelDetails(info: info, car: car))
        }
    }
}

func printTravelRoute(from departure: inout String, to destination: String) {
    route += ", " + destination
    print("* \(departure) - \(destination)")
    departure = destination
}

func getTravelDetails (info: [String: Double], car: CarInfo) -> (costOnPlane: Double, priceFly: Double, spendFuel: Double, costOnCar: Double, costToStay: Double) {
    let priceFly = info[priceFly] ?? 0.0
    let costOnPlane: Double = priceFly * Double(countТravelers)
    let spendFuel: Double = (info[distanceByCar] ?? 0.0) / 100 * (car?.fuelСonsumption ?? 0.0)
    let costOnCar: Double = spendFuel * (info[fuelPrice] ?? 0.0)
    let costToStay: Double = (info[dayToStay] ?? 0.0) * (info[priceOneNight] ?? 0.0)
    return (costOnPlane: costOnPlane, priceFly: priceFly, spendFuel: spendFuel, costOnCar: costOnCar, costToStay: costToStay)
}

func printTravelDetails (car: CarInfo, info: [String: Double], travelDetails: (costOnPlane: Double, priceFly: Double, spendFuel: Double, costOnCar: Double, costToStay: Double)) {
    var routeData = ""
    if let car = car {
        routeData += """
                Расстояние на 🚗(\(car.model)): \(String(format: "%.2f", info[distanceByCar] ?? 0.0)) км.
                Стоимость на машине: \(String(format: "%.2f", travelDetails.costOnCar)) руб.
                Потрачно литров: \(String(format: "%.2f", travelDetails.spendFuel)) л.\n
            """
    } else {
        routeData += """
                Расстояние на ✈️: \(String(format: "%.2f", info[distanceByPlane] ?? 0.0)) км.
                Цена билета: \(String(format: "%.2f", travelDetails.priceFly)) руб.
                Стоимость перелета: \(String(format: "%.2f", travelDetails.costOnPlane)) руб.\n
            """
    }
    routeData += "    Стоимость проживания: \(String(format: "%.2f", travelDetails.costToStay)) руб.\n"
    print(routeData)
}

func calculateSummaryInfo (car: CarInfo, info: [String: Double], travelDetails: (costOnPlane: Double, priceFly: Double, spendFuel: Double, costOnCar: Double, costToStay: Double)) {
    if car != nil {
        sumDistance.append(info[distanceByCar] ?? 0.0)
        spendMoneyCar.append(travelDetails.costOnCar)
        spendMoneyPlane.append(0.0)
    } else {
        sumDistance.append(info[distanceByPlane] ?? 0.0)
        spendMoneyCar.append(0.0);
        spendMoneyPlane.append(travelDetails.costOnPlane)
    }
    spendFuelAll.append(travelDetails.spendFuel)
    spendMoneyOnStay.append(travelDetails.costToStay)
    spendMoneyAll = spendMoneyCar.reduce(0, +) + spendMoneyOnStay.reduce(0, +) + spendMoneyPlane.reduce(0, +)
}

spendFuelAll = spendFuelAll.map{ round($0) }
spendMoneyCar = spendMoneyCar.map{ round($0) }
spendMoneyPlane = spendMoneyPlane.map{ round($0) }
spendMoneyOnStay = spendMoneyOnStay.map{ round($0) }

let result =
"""
Итог:
    Преодолено: \(sumDistance.reduce(0, +)) км.
    Потрачено топлива: \(spendFuelAll.reduce(0, +)) л.
    Потрачено на топливо: \(spendMoneyCar.reduce(0, +)) руб.
    Потрачено на билеты: \(spendMoneyPlane.reduce(0, +)) руб.
    Потрачено на проживание: \(spendMoneyOnStay.reduce(0, +)) руб.
        ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.

Маршрут путешествия: \(route)
"""
print(result)
