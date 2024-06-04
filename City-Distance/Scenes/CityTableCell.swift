


import UIKit

class CityTableCell: UITableViewCell {

    
    lazy private var bgView: UIView = {
       let image = UIView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        return image
    }()
    lazy private var cityLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Bold", size: 14)
        return label
    }()
    lazy private var cityLogo: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "cityIcon")
        return image
    }()
    lazy private var countryLogo: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    lazy private var countryLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 15)
        return label
    }()
    lazy private var locationLogo: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "location")
        return image
    }()
    lazy private var distanceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial Bold", size: 15)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        configureViews()
        addSubViews()
        setupLayoutConstraint()
    }
    
    private func configureViews(){
        countryLogo.layer.masksToBounds = true
        countryLogo.layer.cornerRadius = 10
  
    }
    
    private func addSubViews(){
       addSubview(bgView)
        bgView.addSubview(cityLabel)
        bgView.addSubview(cityLogo)
        bgView.addSubview(countryLabel)
        bgView.addSubview(countryLogo)
        bgView.addSubview(distanceLabel)
        bgView.addSubview(locationLogo)
    }
    
    private func setupLayoutConstraint(){
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
        ])
        NSLayoutConstraint.activate([
            cityLogo.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 13),
            cityLogo.centerXAnchor.constraint(equalTo: countryLogo.centerXAnchor, constant: 0),
            cityLogo.widthAnchor.constraint(equalToConstant: 27),
            cityLogo.heightAnchor.constraint(equalToConstant: 27),
        ])
        NSLayoutConstraint.activate([
            cityLabel.centerYAnchor.constraint(equalTo: cityLogo.centerYAnchor, constant: 0),
            cityLabel.leadingAnchor.constraint(equalTo: cityLogo.trailingAnchor, constant: 10),
        ])
        NSLayoutConstraint.activate([
            countryLogo.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            countryLogo.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 15),
            countryLogo.widthAnchor.constraint(equalToConstant: 18),
            countryLogo.heightAnchor.constraint(equalToConstant: 18),
        ])
         NSLayoutConstraint.activate([
             countryLabel.centerYAnchor.constraint(equalTo: countryLogo.centerYAnchor, constant: 0),
             countryLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor, constant: 0),
         ])
        NSLayoutConstraint.activate([
            locationLogo.topAnchor.constraint(equalTo: countryLogo.bottomAnchor, constant: 20),
            locationLogo.centerXAnchor.constraint(equalTo: countryLogo.centerXAnchor, constant: 0),
            locationLogo.widthAnchor.constraint(equalToConstant: 14),
            locationLogo.heightAnchor.constraint(equalToConstant: 14),
        ])
        NSLayoutConstraint.activate([
            distanceLabel.centerYAnchor.constraint(equalTo: locationLogo.centerYAnchor, constant: 0),
            distanceLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor, constant: 0),
        ])
    }
}

extension CityTableCell: ViewCellProtocol {
    
    func displayCity(city: String) {
        cityLabel.text = city
    }
    func displayCountry(country: String) {
        countryLabel.text = country
    }
    func displayDistance(dist: String) {
        distanceLabel.text = dist
    }
    func displayImage(url: String) {
        CashingImage.shared.KingFisher(countryLogo, url)
    } 
}
