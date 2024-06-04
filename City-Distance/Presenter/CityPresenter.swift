


import Foundation


protocol ViewProtocol: AnyObject{
    func fetchDataSucces()
    func showActivity()
    func hideActivity()
}
protocol ViewCellProtocol: AnyObject{
    func displayCity(city: String)
    func displayCountry(country: String)
    func displayDistance(dist: String)
    func displayImage(url: String)
}
protocol CityProtocol: AnyObject{
    func featchData()
    func numberOfRowsInSection()-> Int
    func configureCell(_ cell: ViewCellProtocol, for item: Int)
}
class CityPresenter: CityProtocol {
    
    weak var delegate : ViewProtocol!
    var city = [CityModel]()
    init(_ delegate: ViewProtocol){
        self.delegate = delegate
    }
    func featchData() {
        self.delegate?.showActivity()
        let url = "https://fotonicapp.com/germany/"
        Networking<[CityModel]>().fetchData(url: url){ data in
            if let data = data {
                DistanceManager.shared.arrangeCityDistance(data){ result in
                    self.city = result
                    self.delegate?.hideActivity()
                    self.delegate?.fetchDataSucces()
                }
            }
        }
    }
    func numberOfRowsInSection() -> Int {
        city.count
    }
    func configureCell(_ cell: ViewCellProtocol, for item: Int) {
        cell.displayCity(city: city[item].city ?? "")
        cell.displayCountry(country: city[item].country ?? "")
        cell.displayDistance(dist: formateDistance(city[item].distance ?? 0.0))
        cell.displayImage(url: city[item].logo ?? "")
    }
    func formateDistance(_ distance: Double) -> String{
        var mesur = ""
        let seDistance = (distance*100).rounded()/100
        var finalDistance = 0.0
        if distance < 1.0 {
            finalDistance = round(seDistance*1000)
            mesur = "Meter"
        } else {
            finalDistance = seDistance
            mesur = "KM"
        }
        return "\(finalDistance) \(mesur)"
    }
}

