//
//  VC2.swift
//  OpenAPI
//
//  Created by 최정민 on 2021/03/03.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import KakaoSDKAuth
import KakaoSDKUser

let apiKey = "b39aeb1e660919371efad86125f1a70d"
var lat : Double = 0
var lon : Double = 0
var UV : Double = 0
var temp40 : [Double] = []
var tempMax40 : [Double] = []
var tempMin40 : [Double] = []
var weather40 : [String] = []
var year40 : [String] = []
var month40 : [String] = []
var day40 : [String] = []
var hour40 : [String] = []
var min40 : [String] = []



class VC2: UIViewController {
    var nickName : String = "사용자"
    var geo : String = ""
    var flagForStart : Bool = false
    var loginFlag : Bool = true
    @IBOutlet weak var locationStateMessage: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var uvLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        
        if loginFlag{
            login()
        }
//        tableView.reloadData()
    }
    @IBOutlet weak var airPollution: UILabel!
    @IBOutlet weak var uvImage: UIImageView!
    @IBOutlet weak var airPollutionImage: UIImageView!
    
    var locationManager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getLocation()
        getCurrentWeather(lat: lat, lon: lon)
        forecastWeather(lat: lat, lon: lon)
        getCurrentUV(lat: lat, lon: lon)
        getCurrentDust(lat: lat, lon: lon)
        getGeo(lat: lat, lon: lon)
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        let tableView_Nib = UINib(nibName: "TableViewCell", bundle: nil)
        
        tableView.register(tableView_Nib, forCellReuseIdentifier: "cell1")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First : viewWillDisappear")
        DispatchQueue.global(qos: .userInitiated).async{
            while true {
                if self.flagForStart {
                    
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                        self.flagForStart = false
                    }
                }
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("First : viewDidDisappear")
        
        DispatchQueue.global(qos: .userInitiated).async{
            var flag :Bool = false
            while true {
                if self.flagForStart {
                    flag = true
                }
                if flag {
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                    usleep(4000000000)
                }
            }
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("First : viewWillDisappear")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("First : viewDidDisappear")
        
    }

}


extension VC2: UITableViewDataSource{
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return temp40.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? TableViewCell else  {
            return UITableViewCell()
        }
 
        cell.temperture.text = "\(temp40[indexPath.row])"+"℃"
        
        
        if "\(weather40[indexPath.row])" == "약간의 구름이 낀 하늘"||"\(weather40[indexPath.row])" == "구름조금"{
            cell.weather.text = "약간의 구름"
            cell.weatherImage.image = UIImage(named: "cloud3")
        } else if "\(weather40[indexPath.row])" == "맑음" {
            cell.weatherImage.image = UIImage(named: "clear")
            cell.weather.text = "\(weather40[indexPath.row])"
        } else if "\(weather40[indexPath.row])" == "실 비" {
            cell.weatherImage.image = UIImage(named: "rain2")
            cell.weather.text = "\(weather40[indexPath.row])"
        } else if "\(weather40[indexPath.row])" == "온흐림" || "\(weather40[indexPath.row])" == "튼구름" {
            cell.weatherImage.image = UIImage(named: "cloudd")
            cell.weather.text = "\(weather40[indexPath.row])"
        }
        
        cell.maxTemperture.text = "최고 \(tempMax40[indexPath.row])"+"℃"
        cell.minTemperture.text = "최저 \(tempMin40[indexPath.row])"+"℃"
        cell.date.text = "\(month40[indexPath.row])월 \(day40[indexPath.row])일"
        cell.time.text = "\(hour40[indexPath.row]):00"
        
        return cell
        
    }
    
 
    

    
       
}


extension VC2: UITableViewDelegate{
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func login() {
       
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {

                    print(error)
                    
                    self.flagForStart = false
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                    
                    let accessToken = oauthToken?.accessToken
                    
                    self.setUserInfo()
                    
                }
            
        }
        
       
    }
    
    func setUserInfo() {
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("me() success.")
                    //do something
                    _ = user
//                    self.infoLabel.text = user?.kakaoAccount?.profile?.nickname
                    print("@@")
                    if let nickName = user?.kakaoAccount?.profile?.nickname {
                        self.locationStateMessage.text = "\(nickName) 님의 위치 : \(self.geo)"
                    }
                    
                    self.flagForStart = true
                    self.loginFlag = false
                    
                    if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                        let data = try? Data(contentsOf: url) {
//                        self.profileImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    
    
    func getCurrentWeather(lat:Double , lon:Double){
        //접근하고자 하는 URL 정보
        let URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric&lang=kr"

        AF.request(URL).responseJSON { response in
            let result = response.result
                  
            switch result {
            case .success(let value):
                let json = JSON(value)
                print("success @@")
//                print(json)
                print(json)
                self.max.text="최고 \(json["main"]["temp_max"].doubleValue)℃"
                self.min.text="최저 \(json["main"]["temp_min"].doubleValue)℃"
                self.currentTemp.text="\(round(json["main"]["temp"].doubleValue*10)/10)℃"
                self.currentWeatherLabel.text="\(json["weather"][0]["description"].stringValue)"
                let currentWeather = json["weather"][0]["main"].stringValue
                if currentWeather == "Rain"{
                    self.currentWeatherImage.image = UIImage(named: "rain")
                } else if currentWeather == "Thunderstrom" {
                    self.currentWeatherImage.image = UIImage(named: "thunderstorm")
                } else if currentWeather == "Clear sky" {
                    self.currentWeatherImage.image = UIImage(named: "clearSky")
                } else if currentWeather == "Few clouds" {
                    self.currentWeatherImage.image = UIImage(named: "fewCloud")
                } else if currentWeather == "Scattered clouds" {
                    self.currentWeatherImage.image = UIImage(named: "scatteredCloud")
                } else if currentWeather == "Broken clouds" {
                    self.currentWeatherImage.image = UIImage(named: "brokenCloud")
                } else if currentWeather == "Shower rain" {
                    self.currentWeatherImage.image = UIImage(named: "showerRain")
                } else if currentWeather == "Snow" {
                    self.currentWeatherImage.image = UIImage(named: "snow")
                } else if currentWeather == "Mist" {
                    self.currentWeatherImage.image = UIImage(named: "mist")
                }
                
            case .failure(let error):
                print(error.errorDescription ?? "")
            default:
                fatalError()
            }
        }
    }
    
    func forecastWeather(lat:Double , lon:Double) {
        //접근하고자 하는 URL 정보
        let URL = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric&lang=kr"

        AF.request(URL).responseJSON { response in
            let result = response.result
                  
            switch result {
            case .success(let value):
                let json = JSON(value)
                print("success")
//                print(json["list"].arrayValue[0])
                
                for index in 0...39 {
                    let temp = json["list"].arrayValue[index]
                    temp40.append(round(temp["main"]["temp"].doubleValue*10)/10)
                    tempMax40.append(round(temp["main"]["temp_max"].doubleValue*10)/10)
                    tempMin40.append(round(temp["main"]["temp_min"].doubleValue*10)/10)
                    weather40.append(temp["weather"][0]["description"].stringValue)
                    var timeString : String = temp["dt_txt"].stringValue
                    var monthString : String = ""
                    var dayString : String = ""
                    var hourString : String = ""
                    for index in 0...1{
                        monthString = monthString + "\(timeString[timeString.index(timeString.startIndex, offsetBy: 5+index)])"
                        dayString = dayString + "\(timeString[timeString.index(timeString.startIndex, offsetBy: 8+index)])"
                        hourString = hourString + "\(timeString[timeString.index(timeString.startIndex, offsetBy:11+index)])"
                    }
                    month40.append(monthString)
                    day40.append(dayString)
                    hour40.append(hourString)
                    
//                    print(hourString)
//
//                    print("@@@@@")

                }
//                print(weather40)

            
            case .failure(let error):
                print(error.errorDescription ?? "")
            default:
                fatalError()
            }
        }
    }
    
    func getCurrentUV(lat:Double , lon:Double) {
        //접근하고자 하는 URL 정보
        let URL = "https://api.openweathermap.org/data/2.5/uvi?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"

        AF.request(URL).responseJSON { response in
            let result = response.result
                  
            switch result {
            case .success(let value):
                let json = JSON(value)
                print("success")
                let uvValue : Double = json["value"].doubleValue
                self.uvLabel.text = "자외선 \(uvValue)"
                
                if uvValue>10{
                    self.uvImage.image = UIImage(named:"verybad")
                }else if uvValue <= 10 && uvValue > 8{
                    self.uvImage.image = UIImage(named:"bad")
                }else if uvValue <= 8 && uvValue > 6{
                    self.uvImage.image = UIImage(named:"soso")
                }else if uvValue <= 6 && uvValue > 3{
                    self.uvImage.image = UIImage(named:"good")
                }else if uvValue <= 3 {
                    self.uvImage.image = UIImage(named:"verygood")
                }
                    
                
            case .failure(let error):
                print(error.errorDescription ?? "")
            default:
                fatalError()
            }
        }
    }
    
    
    func getCurrentDust(lat:Double , lon:Double) {
        //접근하고자 하는 URL 정보
        let URL = "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"
            

        AF.request(URL).responseJSON { response in
            let result = response.result
                  
            switch result {
            case .success(let value):
                let json = JSON(value)
                print("success")
                var airPollutionIndex : String = ""
                switch json["list"][0]["main"]["aqi"].intValue {
                case 1:
                    airPollutionIndex = "매우 좋음"
                    self.airPollutionImage.image = UIImage(named: "veryGood")
                case 2:
                    airPollutionIndex = "좋음"
                    self.airPollutionImage.image = UIImage(named: "good")
                case 3:
                    airPollutionIndex = "보통"
                    self.airPollutionImage.image = UIImage(named: "soso")
                case 4:
                    airPollutionIndex = "나쁨"
                    self.airPollutionImage.image = UIImage(named: "bad")
                case 5:
                    airPollutionIndex = "매우 나쁨"
                    self.airPollutionImage.image = UIImage(named: "verybad")
                default:
                    break
                }
                self.airPollution.text = "공기 \(airPollutionIndex)"
               
            case .failure(let error):
                print(error.errorDescription ?? "")
            default:
                fatalError()
            }
        }
    }
    
    
    func getGeo(lat:Double , lon:Double) {
        //접근하고자 하는 URL 정보
        let URL =
            "https://api.openweathermap.org/geo/1.0/reverse?lat=\(lat)&lon=\(lon)&limit=1&appid=\(apiKey)"
        
        AF.request(URL).responseJSON { response in
            let result = response.result
                  
            switch result {
            case .success(let value):
                let json = JSON(value)
                print("success")
                let Geo : String = json[0]["name"].stringValue
                self.geo = Geo
    
            case .failure(let error):
                print(error.errorDescription ?? "")
            default:
                fatalError()
            }
        }
    }
    

    
}


extension VC2: CLLocationManagerDelegate {
    
    
    func getLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate
        lat = coor?.latitude ?? 0
        lon = coor?.longitude ?? 0
        
        print(lat)
        print(lon)
    }
    
    
    
    
}


