import UIKit
let departure = "Departure"
let destination = "Destination"
var road = [departure: ["Архангельск": [0.0,0.0]] ,
            destination: ["Санкт-Петербург": [735.0, 1109.0]]]
typealias CarInfo = (model: String, fuelСonsumption: Double)?
var car: CarInfo = ("Volkswagen", 7.2)
var fuelPrice = 55.5
let countТravelers = 2
var byCar = true
print("Кол-во путешевственников: \(countТravelers)\n")
var sumDistance = [Double]()
var spendFuelAll = [Double]()
var spendMoneyCar = [Double]()
var spendMoneyPlane = [Double]()
var spendMoneyOnStay = [Double]()
var spendMoneyAll: Double = 0
var priceFly = 5500.0
var dayToStay = 3
var priceOneNight = 2500.0

var route = (road[departure]?.first?.key ?? "") + ", " + (road[destination]?.first?.key ?? "")
var costOnCar: Double = 0
var spendFuel: Double = 0

if let car = car {
    spendFuel = (road[destination]?.first?.value[0] ?? 0.0) / 100 * car.fuelСonsumption
    costOnCar = spendFuel * fuelPrice
} else {
    byCar = false
    costOnCar = 0
    spendFuel = 0
}

var costOnPlane = priceFly * Double(countТravelers)
var costToStay = Double(dayToStay) * priceOneNight
var routeData = "1) \((road[departure]?.first?.key ?? "")) - \((road[destination]?.first?.key ?? ""))\n"

if byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", (road[destination]?.first?.value[0] ?? 0.0))) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar.append(costOnCar)
    spendFuelAll.append(spendFuel)
    sumDistance.append(road[destination]?.first?.value[0] ?? 0.0)
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", (road[destination]?.first?.value[1] ?? 0.0))) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane.append(costOnPlane)
    sumDistance.append(road[destination]?.first?.value[1] ?? 0.0)
}

print(routeData)
spendMoneyOnStay.append(costToStay)
spendMoneyAll = spendMoneyCar.reduce(0, { $0 + $1 }) + spendMoneyOnStay.reduce(0, { $0 + $1 }) + spendMoneyPlane.reduce(0, { $0 + $1 })
var result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance.reduce(0, { $0 + $1 }))) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll.reduce(0, { $0 + $1 }))) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar.reduce(0, { $0 + $1 }))) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane.reduce(0, { $0 + $1 }))) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay.reduce(0, { $0 + $1 }))) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)

road = [departure: ["Санкт-Петербург": [0.0,0.0]] ,
        destination: ["Хельсинки": [299.0, 381.0]]]
byCar = true
priceFly = 4500.0
dayToStay = 1
priceOneNight = 5000.0
route += ", " + (road[destination]?.first?.key ?? "")
car = nil

if let car = car {
    spendFuel = (road[destination]?.first?.value[0] ?? 0.0) / 100 * car.fuelСonsumption
    costOnCar = spendFuel * fuelPrice
} else {
    byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "2) \((road[departure]?.first?.key ?? "")) - \((road[destination]?.first?.key ?? ""))\n"

if byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", (road[destination]?.first?.value[0] ?? 0.0))) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar.append(costOnCar)
    spendFuelAll.append(spendFuel)
    sumDistance.append(road[destination]?.first?.value[0] ?? 0.0)
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", (road[destination]?.first?.value[1] ?? 0.0))) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane.append(costOnPlane)
    sumDistance.append(road[destination]?.first?.value[1] ?? 0.0)
}

print(routeData)
spendMoneyOnStay.append(costToStay)
spendMoneyAll = spendMoneyCar.reduce(0, { $0 + $1 }) + spendMoneyOnStay.reduce(0, { $0 + $1 }) + spendMoneyPlane.reduce(0, { $0 + $1 })
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance.reduce(0, { $0 + $1 }))) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll.reduce(0, { $0 + $1 }))) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar.reduce(0, { $0 + $1 }))) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane.reduce(0, { $0 + $1 }))) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay.reduce(0, { $0 + $1 }))) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


road = [departure: ["Хельсинки": [0.0,0.0]] ,
        destination: ["Барселона": [2_606.0, 3_425.0]]]
byCar = true
priceFly = 18702.0
dayToStay = 7
priceOneNight = 7500.0
route += ", " + (road[destination]?.first?.key ?? "")
car = ("Fiat", 6.7)

if let car = car {
    spendFuel = (road[destination]?.first?.value[0] ?? 0.0) / 100 * car.fuelСonsumption
    costOnCar = spendFuel * fuelPrice
} else {
    byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "3) \((road[departure]?.first?.key ?? "")) - \((road[destination]?.first?.key ?? ""))\n"

if byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", (road[destination]?.first?.value[0] ?? 0.0))) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar.append(costOnCar)
    spendFuelAll.append(spendFuel)
    sumDistance.append(road[destination]?.first?.value[0] ?? 0.0)
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", (road[destination]?.first?.value[1] ?? 0.0))) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane.append(costOnPlane)
    sumDistance.append(road[destination]?.first?.value[1] ?? 0.0)
}

print(routeData)
spendMoneyOnStay.append(costToStay)
spendMoneyAll = spendMoneyCar.reduce(0, { $0 + $1 }) + spendMoneyOnStay.reduce(0, { $0 + $1 }) + spendMoneyPlane.reduce(0, { $0 + $1 })
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance.reduce(0, { $0 + $1 }))) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll.reduce(0, { $0 + $1 }))) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar.reduce(0, { $0 + $1 }))) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane.reduce(0, { $0 + $1 }))) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay.reduce(0, { $0 + $1 }))) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


road = [departure: ["Барселона": [0.0,0.0]] ,
        destination: ["Минск": [2338.0, 2912.0]]]
priceFly = 18702.0
dayToStay = 2
priceOneNight = 4000.0
route += ", " + (road[destination]?.first?.key ?? "")
car = ("Opel", 8.0)

if let car = car {
    spendFuel = (road[destination]?.first?.value[0] ?? 0.0) / 100 * car.fuelСonsumption
    costOnCar = spendFuel * fuelPrice
} else {
    byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "4) \((road[departure]?.first?.key ?? "")) - \((road[destination]?.first?.key ?? ""))\n"

if byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", (road[destination]?.first?.value[0] ?? 0.0))) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar.append(costOnCar)
    spendFuelAll.append(spendFuel)
    sumDistance.append(road[destination]?.first?.value[0] ?? 0.0)
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", (road[destination]?.first?.value[1] ?? 0.0))) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane.append(costOnPlane)
    sumDistance.append(road[destination]?.first?.value[1] ?? 0.0)
}

print(routeData)
spendMoneyOnStay.append(costToStay)
spendMoneyAll = spendMoneyCar.reduce(0, { $0 + $1 }) + spendMoneyOnStay.reduce(0, { $0 + $1 }) + spendMoneyPlane.reduce(0, { $0 + $1 })
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance.reduce(0, { $0 + $1 }))) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll.reduce(0, { $0 + $1 }))) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar.reduce(0, { $0 + $1 }))) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane.reduce(0, { $0 + $1 }))) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay.reduce(0, { $0 + $1 }))) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)


road = [departure: ["Минск": [0.0,0.0]] ,
        destination: ["Москва": [676.0, 718.0]]]
byCar = true
priceFly = 7497.0
dayToStay = 1
priceOneNight = 6000.0
route += ", " + (road[destination]?.first?.key ?? "")
car = ("Hyundai", 7.7)

if let car = car {
    spendFuel = (road[destination]?.first?.value[0] ?? 0.0) / 100 * car.fuelСonsumption
    costOnCar = spendFuel * fuelPrice
} else {
    byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "5) \((road[departure]?.first?.key ?? "")) - \((road[destination]?.first?.key ?? ""))\n"

if byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", (road[destination]?.first?.value[0] ?? 0.0))) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar.append(costOnCar)
    spendFuelAll.append(spendFuel)
    sumDistance.append(road[destination]?.first?.value[0] ?? 0.0)
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", (road[destination]?.first?.value[1] ?? 0.0))) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane.append(costOnPlane)
    sumDistance.append(road[destination]?.first?.value[1] ?? 0.0)
}

print(routeData)
spendMoneyOnStay.append(costToStay)
spendMoneyAll = spendMoneyCar.reduce(0, { $0 + $1 }) + spendMoneyOnStay.reduce(0, { $0 + $1 }) + spendMoneyPlane.reduce(0, { $0 + $1 })
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance.reduce(0, { $0 + $1 }))) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll.reduce(0, { $0 + $1 }))) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar.reduce(0, { $0 + $1 }))) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane.reduce(0, { $0 + $1 }))) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay.reduce(0, { $0 + $1 }))) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)

road = [departure: ["Москва": [0.0,0.0]] ,
        destination: ["Ярославль": [251.0, 275.0]]]
byCar = true
priceFly = 3000.0
dayToStay = 1
priceOneNight = 2000.0
route += ", " + (road[destination]?.first?.key ?? "")
car = ("Toyota", 8.2)

if let car = car {
    spendFuel = (road[destination]?.first?.value[0] ?? 0.0) / 100 * car.fuelСonsumption
    costOnCar = spendFuel * fuelPrice
} else {
    byCar = false
    costOnCar = 0
    spendFuel = 0
}

costOnPlane = priceFly * Double(countТravelers)
costToStay = Double(dayToStay) * priceOneNight
routeData = "6) \((road[departure]?.first?.key ?? "")) - \((road[destination]?.first?.key ?? ""))\n"

if byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", (road[destination]?.first?.value[0] ?? 0.0))) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar.append(costOnCar)
    spendFuelAll.append(spendFuel)
    sumDistance.append(road[destination]?.first?.value[0] ?? 0.0)
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", (road[destination]?.first?.value[1] ?? 0.0))) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane.append(costOnPlane)
    sumDistance.append(road[destination]?.first?.value[1] ?? 0.0)
}

print(routeData)
spendMoneyOnStay.append(costToStay)
spendMoneyAll = spendMoneyCar.reduce(0, { $0 + $1 }) + spendMoneyOnStay.reduce(0, { $0 + $1 }) + spendMoneyPlane.reduce(0, { $0 + $1 })
result =
"""
Промежуточный итог:
        Преодолено: \(String(format: "%.2f", sumDistance.reduce(0, { $0 + $1 }))) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll.reduce(0, { $0 + $1 }))) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar.reduce(0, { $0 + $1 }))) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane.reduce(0, { $0 + $1 }))) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay.reduce(0, { $0 + $1 }))) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)

road = [departure: ["Ярославль": [0.0,0.0]] ,
        destination: ["Архангельск": [771.0, 971.0]]]
byCar = false
priceFly = 11949.0
route += ", " + (road[destination]?.first?.key ?? "")
car = nil
spendFuel = (road[destination]?.first?.value[0] ?? 0.0)  / 100 * (car?.fuelСonsumption ?? 0)
costOnCar = spendFuel * fuelPrice

if car == nil {
    byCar = false
}

costOnPlane = priceFly * Double(countТravelers)
routeData = "7) \((road[departure]?.first?.key ?? "")) - \((road[destination]?.first?.key ?? ""))\n"

if byCar {
    routeData += """
        Расстояние на автомобиле: \(String(format: "%.2f", (road[destination]?.first?.value[0] ?? 0.0))) км.;
        Стоимость на машине: \(String(format: "%.2f", costOnCar)) руб.;
        Потрачно литров: \(String(format: "%.2f", spendFuel)) л.\n
    """
    spendMoneyCar.append(costOnCar)
    spendFuelAll.append(spendFuel)
    sumDistance.append(road[destination]?.first?.value[0] ?? 0.0)
} else {
    routeData += """
        Расстояние на самолете: \(String(format: "%.2f", (road[destination]?.first?.value[1] ?? 0.0))) км.;
        Цена билета: \(String(format: "%.2f", priceFly)) руб.;
        Стоимость перелета: \(String(format: "%.2f", costOnPlane)) руб.;\n
    """
    spendMoneyPlane.append(costOnPlane)
    sumDistance.append(road[destination]?.first?.value[1] ?? 0.0)
}

print(routeData)
spendMoneyAll = spendMoneyCar.reduce(0, { $0 + $1 }) + spendMoneyOnStay.reduce(0, { $0 + $1 }) + spendMoneyPlane.reduce(0, { $0 + $1 })
result =
"""
Итог(на машине):
        Преодолено: \(String(format: "%.2f", sumDistance.reduce(0, { $0 + $1 }))) км.
        Потрачено топлива: \(String(format: "%.2f",spendFuelAll.reduce(0, { $0 + $1 }))) л.
        Потрачено на топливо: \(String(format: "%.2f",spendMoneyCar.reduce(0, { $0 + $1 }))) руб.
        Потрачено на билеты: \(String(format: "%.2f",spendMoneyPlane.reduce(0, { $0 + $1 }))) руб.
        Потрачено на проживание: \(String(format: "%.2f",spendMoneyOnStay.reduce(0, { $0 + $1 }))) руб.
            ВСЕГО: \(String(format: "%.2f",spendMoneyAll)) руб.\n
"""
print(result)

let routeInfo = """
Маршрут путешевствия: \(route)
"""
print(routeInfo)
