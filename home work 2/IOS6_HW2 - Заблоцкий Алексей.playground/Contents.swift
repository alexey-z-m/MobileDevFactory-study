import UIKit

typealias RoadInfo = (nameCityNow: String, nameCityDestination: String, distanceByPlane: Double, distanceByCar: Double, byCar: Bool)
var roadInfo: RoadInfo = ("Архангельск", "Санкт-Петербург", 735, 1109, true)
typealias CarInfo = (model: String, fuelСonsumption: Double)?
var car: CarInfo = ("Volkswagen", 7.2)
var fuelPrice = 55.5
let countТravelers = 2
print("Кол-во путешевственников: \(countТravelers)\n")
var sumDistance: Double = 0
var spendFuelAll: Double = 0
var spendMoneyCar: Double = 0
var spendMoneyPlane: Double = 0
var spendMoneyOnStay: Double = 0
var spendMoneyAll: Double = 0
var priceFly = 5500.0
var dayToStay = 3
var priceOneNight = 2500.0
var route = roadInfo.nameCityNow + ", " + roadInfo.nameCityDestination
var costOnCar: Double = 0
var spendFuel: Double = 0

if let car = car {
    costOnCar = roadInfo.distanceByCar / 100 * car.fuelСonsumption * fuelPrice
    spendFuel = roadInfo.distanceByCar / 100 * car.fuelСonsumption
} else {
    roadInfo.byCar = false
    costOnCar = 0
    spendFuel = 0
}

var costOnPlane = priceFly * Double(countТravelers)
var costToStay = Double(dayToStay) * priceOneNight
var routeData = "1) \(roadInfo.nameCityNow) - \(roadInfo.nameCityDestination)\n"

if roadInfo.byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", roadInfo.distanceByCar)) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar += costOnCar
    spendFuelAll += spendFuel
    sumDistance += roadInfo.distanceByCar
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", roadInfo.distanceByPlane)) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane += costOnPlane
    sumDistance += roadInfo.distanceByPlane
}

print(routeData)
spendMoneyOnStay += costToStay
spendMoneyAll = spendMoneyCar + spendMoneyOnStay + spendMoneyPlane
var result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance)) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll)) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar)) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane)) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay)) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


roadInfo = (roadInfo.nameCityDestination, "Хельсинки", 299, 381, true)
priceFly = 4500.0
dayToStay = 1
priceOneNight = 5000.0
route += ", " + roadInfo.nameCityDestination
car = nil

if let car = car {
    costOnCar = roadInfo.distanceByCar / 100 * car.fuelСonsumption * fuelPrice
    spendFuel = roadInfo.distanceByCar / 100 * car.fuelСonsumption
} else {
    roadInfo.byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "2) \(roadInfo.nameCityNow) - \(roadInfo.nameCityDestination)\n"

if roadInfo.byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", roadInfo.distanceByCar)) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar += costOnCar
    spendFuelAll += spendFuel
    sumDistance += roadInfo.distanceByCar
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", roadInfo.distanceByPlane)) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane += costOnPlane
    sumDistance += roadInfo.distanceByPlane
}

print(routeData)
spendMoneyOnStay += costToStay
spendMoneyAll = spendMoneyCar + spendMoneyOnStay + spendMoneyPlane
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance)) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll)) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar)) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane)) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay)) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


roadInfo = (roadInfo.nameCityDestination, "Барселона", 2_606, 3_425, true)
priceFly = 18702.0
dayToStay = 7
priceOneNight = 7500.0
route += ", " + roadInfo.nameCityDestination
car = ("Fiat", 6.7)

if let car = car {
    costOnCar = roadInfo.distanceByCar / 100 * car.fuelСonsumption * fuelPrice
    spendFuel = roadInfo.distanceByCar / 100 * car.fuelСonsumption
} else {
    roadInfo.byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "3) \(roadInfo.nameCityNow) - \(roadInfo.nameCityDestination)\n"

if roadInfo.byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", roadInfo.distanceByCar)) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar += costOnCar
    spendFuelAll += spendFuel
    sumDistance += roadInfo.distanceByCar
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", roadInfo.distanceByPlane)) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane += costOnPlane
    sumDistance += roadInfo.distanceByPlane
}

print(routeData)
spendMoneyOnStay += costToStay
spendMoneyAll = spendMoneyCar + spendMoneyOnStay + spendMoneyPlane
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance)) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll)) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar)) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane)) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay)) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


roadInfo = (roadInfo.nameCityDestination, "Минск", 2338, 2912, true)
priceFly = 18702.0
dayToStay = 2
priceOneNight = 4000.0
route += ", " + roadInfo.nameCityDestination
car = ("Opel", 8.0)

if let car = car {
    costOnCar = roadInfo.distanceByCar / 100 * car.fuelСonsumption * fuelPrice
    spendFuel = roadInfo.distanceByCar / 100 * car.fuelСonsumption
} else {
    roadInfo.byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "4) \(roadInfo.nameCityNow) - \(roadInfo.nameCityDestination)\n"

if roadInfo.byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", roadInfo.distanceByCar)) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar += costOnCar
    spendFuelAll += spendFuel
    sumDistance += roadInfo.distanceByCar
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", roadInfo.distanceByPlane)) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane += costOnPlane
    sumDistance += roadInfo.distanceByPlane
}

print(routeData)
spendMoneyOnStay += costToStay
spendMoneyAll = spendMoneyCar + spendMoneyOnStay + spendMoneyPlane
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance)) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll)) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar)) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane)) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay)) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


roadInfo = (roadInfo.nameCityDestination, "Москва", 676, 718, true)
priceFly = 7497.0
dayToStay = 1
priceOneNight = 6000.0
route += ", " + roadInfo.nameCityDestination
car = ("Hyundai", 7.7)

if let car = car {
    costOnCar = roadInfo.distanceByCar / 100 * car.fuelСonsumption * fuelPrice
    spendFuel = roadInfo.distanceByCar / 100 * car.fuelСonsumption
} else {
    roadInfo.byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "5) \(roadInfo.nameCityNow) - \(roadInfo.nameCityDestination)\n"

if roadInfo.byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", roadInfo.distanceByCar)) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar += costOnCar
    spendFuelAll += spendFuel
    sumDistance += roadInfo.distanceByCar
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", roadInfo.distanceByPlane)) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane += costOnPlane
    sumDistance += roadInfo.distanceByPlane
}

print(routeData)
spendMoneyOnStay += costToStay
spendMoneyAll = spendMoneyCar + spendMoneyOnStay + spendMoneyPlane
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance)) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll)) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar)) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane)) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay)) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


roadInfo = (roadInfo.nameCityDestination, "Ярославль", 251, 275, true)
priceFly = 3000.0
dayToStay = 1
priceOneNight = 2000.0
route += ", " + roadInfo.nameCityDestination
car = ("Toyota", 8.2)

if let car = car {
    costOnCar = roadInfo.distanceByCar / 100 * car.fuelСonsumption * fuelPrice
    spendFuel = roadInfo.distanceByCar / 100 * car.fuelСonsumption
} else {
    roadInfo.byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "6) \(roadInfo.nameCityNow) - \(roadInfo.nameCityDestination)\n"

if roadInfo.byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", roadInfo.distanceByCar)) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar += costOnCar
    spendFuelAll += spendFuel
    sumDistance += roadInfo.distanceByCar
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", roadInfo.distanceByPlane)) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane += costOnPlane
    sumDistance += roadInfo.distanceByPlane
}

print(routeData)
spendMoneyOnStay += costToStay
spendMoneyAll = spendMoneyCar + spendMoneyOnStay + spendMoneyPlane
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance)) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll)) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar)) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane)) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay)) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


roadInfo = (roadInfo.nameCityDestination, "Архангельск", 771, 971, false)
priceFly = 11949.0
route += ", " + roadInfo.nameCityDestination
car = nil
costOnCar = roadInfo.distanceByCar / 100 * (car?.fuelСonsumption ?? 0) * fuelPrice
spendFuel = roadInfo.distanceByCar / 100 * (car?.fuelСonsumption ?? 0)

if car == nil {
    roadInfo.byCar = false
}

costOnPlane = priceFly * Double(countТravelers)
routeData = "7) \(roadInfo.nameCityNow) - \(roadInfo.nameCityDestination)\n"

if roadInfo.byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", roadInfo.distanceByCar)) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar += costOnCar
    spendFuelAll += spendFuel
    sumDistance += roadInfo.distanceByCar
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", roadInfo.distanceByPlane)) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane += costOnPlane
    sumDistance += roadInfo.distanceByPlane
}

print(routeData)
spendMoneyAll = spendMoneyCar + spendMoneyOnStay + spendMoneyPlane
result =
"""
Итог(на машине):
        Преодолено: \(String(format: "%.2f", sumDistance)) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll)) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar)) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane)) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay)) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)

let routeInfo = """
Маршрут путешевствия: \(route)
"""
print(routeInfo)
