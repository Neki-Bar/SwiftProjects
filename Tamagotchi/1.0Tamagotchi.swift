import Foundation

class Tamagotchi {
    private let foodMax: Int = 10
    private let waterMax: Int = 10
    private let sleepMax: Int = 15

    private var foodReserve: Int = 5
    private var waterReserve: Int = 5
    private var sleepReserve: Int = 5

    func eat() {
        if foodReserve < foodMax { foodReserve += 1 }
    }

    func drink() {
        if waterReserve < waterMax { waterReserve += 1 }
    }

    func sleep() {
        if sleepReserve < sleepMax { sleepReserve += 3 }
    }

    func play() {
        foodReserve > 1 ? (foodReserve -= 1) : (foodReserve = 0)
        waterReserve > 2 ? (waterReserve -= 2) : (waterReserve = 0)
        sleepReserve > 2 ? (sleepReserve -= 2) : (sleepReserve = 0)
    }

    func printProp() {
        print("Food: \(foodReserve), water: \(waterReserve), sleep: \(sleepReserve)")
    }
}

func test() {
    let boni: Tamagotchi = Tamagotchi()
    boni.printProp()
    boni.eat()
    boni.drink()
    boni.sleep()
    boni.printProp()
    boni.play()
    boni.printProp()
}

test()