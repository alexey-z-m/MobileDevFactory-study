// Структуры городов , машин и отелей для удобства
struct City {
    let nameOfCity: String
    var population: Int
    var distance: Int
    var citiesCount = 0
    var infoAboutCity:  String {
        return "Город :\(nameOfCity) , население города : \(population)"
    }
    var fromToCity: String = "Ekaterinburg" {
        
        willSet {
            print("Мы приехали в город \(newValue) , из города \(fromToCity) , дистанция между городами была \(distance)")
            citiesCount += 1
        }
        didSet {
            if citiesCount >= 6 {
                print("Ура! Мы проехали весь наш маршрут, мы побывали во всех 6 городах")
            }
        }
    }
}

class Car {
    var modelName: String
    let color: String
    let fuelСonsumption: Double
    init(modelName: String, color: String ,fuelСonsumption: Double) {
        self.modelName = modelName
        self.color = color
        self.fuelСonsumption = fuelСonsumption
    }
}

struct Hotel  {
    let name: String
    var priceForOneDay: Int
    var days: Int
    func resultCost () -> Int {
        let costs = self.priceForOneDay * self.days
        return costs
    }
}

// Затраты
var spendingOnPlane: [Int] = []
var spendingOnCar: [Int] = []
var spendingOnAccommodation: [Int] = []
var spendingEating: [Int] = []
var spendingOnOther: [Int] = []

func spendingOnUsualDay (eating:Int?, accomodation:Int?, other:Int?){
    spendingEating.append(eating ?? 0)
    spendingOnAccommodation.append(accomodation ?? 0)
    spendingOnOther.append(other ?? 0)
}

func spendingOnMovement (plane:Int?,car:Int?) {
    spendingOnPlane.append(plane ?? 0)
    spendingOnCar.append(car ?? 0)
}

func printStory (story:() -> Void) {
  story()
}

//  Персонажи истории
let myName = "Paul"
let nameOfTeacher = "Maksim"

/*  О городах
 let cities = ["Ekaterinburg","Novosibirsk","Moscow","Rome","Milan","Florence","Mazara"]
 let  ekbToNovosib = ["Departure": ["Ekaterinburg": 0], "Destination": ["Novosibirsk": 1600]]
 let novosibToMoscow = ["Departure": ["Novosibirsk": 0], "Destination": ["Moscow": 3400]]
 let moscowToRome = ["Departure": ["Moscow": 0], "Destination": ["Rome": 3000]]
 let romeToMilan = ["Departure": ["Rome": 0], "Destination": ["Milan": 590]]
 let milanToFlorence = ["Departure": ["Milan": 0], "Destination": ["Florence": 590]]
 let florenceToMazara = ["Departure": ["Florence": 0], "Destination": ["Mazara": 1310]]*/

let ekaterinburg = City(nameOfCity: "Ekaterinburg", population: 1800000, distance: 0)
var novosib = City(nameOfCity: "Novosibirsk", population: 2000000, distance: 1600, fromToCity: "Ekaterinburg")

novosib.fromToCity = "Novosibirsk"
// о машинах и самолете
let costDiasel = 55.77
let myCar = Car(modelName:"Audi A5", color: "Orange", fuelСonsumption: 6.5)
let rentCar = Car(modelName: "BMW 530D", color: "Black", fuelСonsumption: 8.3)

var spendOnAudi = Double(novosib.distance) / 100 * myCar.fuelСonsumption
let costOfTripFromEkbToNov = Int(spendOnAudi * costDiasel)

// Выбор как передвигаться на машине или лететь на самолете через enum для тренировки
enum Transport {
    case car (String , Int)
    case plane (String , Int)
}
var wayToTravel = Transport.car(" \(myCar.modelName) " , costOfTripFromEkbToNov)

func cheakingWayToTravel (way: Transport) {
    switch way {
    case .car(let distance , let cost):
        spendingOnMovement(plane: nil, car: cost)
        print("Поедем на машине \(distance) ,стоимость поездки составит \(cost)")
    case .plane(let distance , let cost):
        spendingOnMovement(plane: cost, car: nil)
        print("Полетим на самолете \(distance) ,стоимость полета составит \(cost)")
    }
}

// Новосибирск
spendingOnPlane.append(11000)
if Int(costOfTripFromEkbToNov) < Int(spendingOnPlane[0]) {
    print("я поеду на машине так как стоимость переезда на машине меньше стоимости билета самолета")
} else {
    print("я полечу на самолете так как стоимость полета меньше ")
}
spendingOnPlane.removeAll()
printStory {
    print("After 20 hours of driving \(nameOfTeacher) kindly invites me to visit his new apartments.I told to \(nameOfTeacher) about my future trip and he say that he wants with me")
}
spendingOnCar += [costOfTripFromEkbToNov]
// Новосиб - Москва
wayToTravel = Transport.plane(" Аэрофлот ", 13000)
cheakingWayToTravel(way: wayToTravel)
var moscow = City(nameOfCity: "Moscow", population: 18000000, distance: 3400,fromToCity: "Novosibirsk")
moscow.fromToCity = "Mосква"
printStory {
    print("We decided tobuy tickets to \(moscow.nameOfCity) on AviaSales.In \(moscow.nameOfCity) we decided to eat in MacDonalds")
}
spendingOnUsualDay(eating: 1200, accomodation: nil, other: nil)

//в рим
var rome = City(nameOfCity: "Rome", population: 5000000, distance: 3000, fromToCity: "Moscow")
rome.fromToCity = "Рим"
wayToTravel = Transport.plane("Аэрофлота", 26000)
cheakingWayToTravel(way: wayToTravel)
printStory {
    print(" We buy tickets and pass covid test and booked apartments for 2 days. we decided to walk around beautiful places and take excursions")
}
let hotelInRome = Hotel(name: "Rome", priceForOneDay: 7000, days: 2)
hotelInRome.resultCost()
spendingOnUsualDay(eating: 20000, accomodation: hotelInRome.resultCost(), other: 12000)

// В милан
var milan = City(nameOfCity: "Милан", population: 2000000, distance: 590, fromToCity: "Рим")
milan.fromToCity =   "Mилан"
printStory {
    print(" After arraving we were going shopping and our budget 100000 rubles. В милане решили остаться на 3 дня")
}
wayToTravel = Transport.plane("Italian Airlines", 12000)
cheakingWayToTravel(way: wayToTravel)
let hotelInMilan = Hotel(name: "Milan Resort", priceForOneDay: 21000, days: 3)
hotelInMilan.resultCost()
spendingOnUsualDay(eating: 17500, accomodation: hotelInMilan.resultCost(), other: 100000)

// В флоренцию
var florence = City(nameOfCity: "Флоренция", population: 1200000, distance: 390, fromToCity: "Milan")
florence.fromToCity = "Florence"
var spendOnBmw = Double(florence.distance) / 100 * rentCar.fuelСonsumption
spendOnBmw = spendOnBmw * costDiasel
wayToTravel = Transport.car(rentCar.modelName, Int(spendOnBmw) )
cheakingWayToTravel(way: wayToTravel)
printStory {
    print("""
          Чтобы добраться до следующих городов мы взяли в аренду машину
          В \(florence.nameOfCity) мы погуляли по всем достопримичательностям
 """)
}
spendingOnUsualDay(eating: 13000, accomodation: nil , other: nil)

// мазара
var mazara = City(nameOfCity: "Mazara", population: 40000, distance: 1310, citiesCount: 6)
spendOnBmw = Double(mazara.distance) / 100 * rentCar.fuelСonsumption
spendOnBmw = spendOnBmw * costDiasel
wayToTravel = Transport.car(rentCar.modelName, Int(spendOnBmw) )
cheakingWayToTravel(way: wayToTravel)
mazara.fromToCity = "Флоренция"
printStory {
    print("After arraving we take in \(mazara.nameOfCity) 2 hotels room for 1 month and book place on bitch")
}
let mazaraHotel = Hotel(name: "mazaraHotel", priceForOneDay: 4000, days: 30)
mazaraHotel.resultCost()
spendingOnUsualDay(eating: 50000, accomodation: mazaraHotel.resultCost(), other: 20000)


print ("затраты на еду :\(spendingEating.reduce(0, { $0 + $1 }))")
print("Затраты на жилье : \(spendingOnAccommodation.reduce(0, { $0 + $1 }))")
print("Затраты на машину : \(spendingOnCar.reduce(0, { $0 + $1 }))")
print("Затраты на авиаперелеты : \(spendingOnPlane.reduce(0, { $0 + $1 }))")
print("Другие расходы : \(spendingOnOther.reduce(0, { $0 + $1 }))")

let allSpending = spendingOnPlane + spendingOnCar + spendingOnAccommodation + spendingEating + spendingOnOther
print("общие расходы : \(allSpending.reduce(0, { $0 + $1 })) ")

var distance = [1600 , 3000 , 3400 , 590 , 1310]
var miles = distance.map {Double($0) / 1.6}
miles


//Задание со звездчкой



func calculate (numbers: Int) -> Int {
    var answer = 0
    for i in 0..<numbers {
        if i.isMultiple(of: 3) || i.isMultiple(of: 5){
                answer += i
        }
    }
    return answer
}
calculate(numbers: 10)
