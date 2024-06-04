

import Foundation


struct CityModel: Codable {
    
    var city, lat, lon, adminName: String?
    var capital: String?
    var population, populationProper: String?
    var country: String?
    var logo: String?
    var distance: Double?

    enum CodingKeys: String, CodingKey {
        case city, lat, lon
        case adminName = "admin_name"
        case capital, population
        case populationProper = "population_proper"
        case country
        case logo
        case distance
    }
}

