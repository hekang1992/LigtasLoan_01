//
//  LLLocationConfig.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/11/2.
//

import CoreLocation
import RxSwift
import RxRelay

class LLLModel: NSObject {
    var tosee : String = ""
    var library : String = ""
    var unfeigned : String = ""
    var thatwas : String = ""
    var battalion: Double = 0.0
    var strongest: Double = 0.0
    var godis : String = ""
}

class LLLocationConfig: NSObject {
    
    private var locationManager = CLLocationManager()
    
    private var locationBlock: ((LLLModel) -> Void)?
    
    let disposeBag = DisposeBag()
    
    var model = BehaviorRelay<LLLModel?>(value: nil)
    
    var type: String = "0"
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        model.debounce(RxTimeInterval.milliseconds(700), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { locationModel in
                if let locationModel = locationModel {
                    self.locationBlock?(locationModel)
                }
            }).disposed(by: disposeBag)
    }
    
}

extension LLLocationConfig: CLLocationManagerDelegate  {
    
    func startUpdatingLocation(completion: @escaping (LLLModel) -> Void) {
        locationBlock = completion
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            if CLLocationManager.authorizationStatus() == .denied {
                let lmodel = LLLModel()
                self.model.accept(lmodel)
            } else {
                locationManager.startUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            let lmodel = LLLModel()
            self.model.accept(lmodel)
            locationManager.stopUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let model = LLLModel()
        model.strongest = location.coordinate.longitude
        model.battalion = location.coordinate.latitude
        let geocoder = CLGeocoder()
        let lion = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        geocoder.reverseGeocodeLocation(lion) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first else { return }
            model.tosee = placemark.locality ?? ""
            model.thatwas = (placemark.subLocality ?? "") + (placemark.thoroughfare ?? "")
            model.unfeigned = placemark.country ?? ""
            model.library = placemark.isoCountryCode ?? ""
            model.godis = placemark.administrativeArea ?? ""
            self.model.accept(model)
            self.locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("api==========error:\(error)")
    }
    
}
