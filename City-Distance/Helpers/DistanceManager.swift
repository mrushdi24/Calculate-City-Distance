



import UIKit
import MapKit
import CoreLocation



class DistanceManager {
    
    static let shared: DistanceManager = DistanceManager()
    
    private func getDistance(latitude: Double, longitude: Double)-> Double {
        let lang:Double = 4.365159636337787 // Brussels City Center Coordinates Langitude
        let lat:Double = 50.83446711140114 // Brussels City Center Coordinate Latitude
        let coordinate1 = CLLocation(latitude: lat, longitude: lang)
        let coordinate2 = CLLocation(latitude: latitude, longitude: longitude)
        let distanceInMeters = coordinate1.distance(from: coordinate2)
        return distanceInMeters / 1000
    }
    
    func arrangeCityDistance(_ cityModel: [CityModel], completion: @escaping (_ Nearby:[CityModel])->()){
        let count = cityModel.count
        var nearabyArray = [CityModel]()
        for index in 0..<count{
            var city = cityModel[index]
            let distance = getDistance(latitude: Double(city.lat ?? "0.0" ) ?? 0.0 , longitude: Double(city.lon ?? "0.0") ?? 0.0)
            city.distance = distance
            nearabyArray.append(city)
        }
        nearabyArray.sort {
            $0.distance ?? 0.0 < $1.distance ?? 0.0
        }
        completion(nearabyArray)

    }
    
}

