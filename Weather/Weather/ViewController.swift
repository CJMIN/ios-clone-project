//
//  ViewController.swift
//  Weather
//
//  Created by 최정민 on 2021/02/19.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    
    @IBOutlet weak var listTableView: UITableView!
    
           
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let location = CLLocation(latitude: 37.498206, longitude: 127.02761)
        
        WeatherDataSource.shared.fetch(location:location){
            self.listTableView.reloadData()
        }
        
    }


}

extension ViewController:
    UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0 :
            return 1
        case 1 :
            return WeatherDataSource.shared.forecastList.count
        default :
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath)
//
//        if indexPath.section == 0 {
//            return cell
//        }
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as! SummaryTableViewCell
            
            if let weather = WeatherDataSource.shared.summary?.weather.first,let main = WeatherDataSource.shared.summary?.main{
                cell.weatherimageView.image = UIImage(named:weather.icon)
                cell.statusLabel.text = weather.description
                cell.minMaxLabel.text = "최고 \(main.temp_max.tempertureString) 최소 \(main.temp_min.tempertureString)"
                cell.currentTemperatureLabel.text = "\(main.temp.tempertureString)"
            }
            
            
            return cell
        } //
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier:ForecastTableViewCell.identifier, for: indexPath) as! ForecastTableViewCell
        
        let target = WeatherDataSource.shared.forecastList[indexPath.row]
        cell.dateLabel.text = target.date.dateString
        cell.timeLabel.text = target.date.timeString
        cell.weatherImageView.image = UIImage(named: target.icon)
        cell.statusLabel.text = target.weather
        cell.tempertureLabel.text = target.temperature.tempertureString
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    
    
}

