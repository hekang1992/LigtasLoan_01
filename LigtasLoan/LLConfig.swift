//
//  LLConfig.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/22.
//

import UIKit
import BRPickerView
import MBProgressHUD

let Bold_SFDisplay = "SFDisplay-Semibold"
let Regular_SFDisplay = "SFDisplay-Light"

let ROOT_VC = "ROOT_VC"

typealias complete = () -> Void

var is_login: Bool {
    return (UserDefaults.standard.object(forKey: LL_NID) as? String)?.isEmpty == false
}

class StatusBarHelper {
    class func getStatusBarHeight() -> CGFloat {
        return (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.statusBarManager?.statusBarFrame.height ?? 30
    }
}

extension UIColor {
    convenience init?(cssStr: String) {
        let hexString = cssStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard hexString.hasPrefix("#") else {
            return nil
        }
        let hexCode = hexString.dropFirst()
        guard hexCode.count == 6, let rgbValue = UInt64(hexCode, radix: 16) else {
            return nil
        }
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

class LoadingManager {
    
    static func addLoadingView() {
        guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        let hud = MBProgressHUD.showAdded(to: keyWindow, animated: true)
        hud.isUserInteractionEnabled = true
    }
    
    static func hideLoadingView() {
        guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        MBProgressHUD.hide(for: keyWindow, animated: true)
    }
}


class SanPopConfig {
    static func SanChengArray(dataArr: [Any]) -> [BRProvinceModel] {
        return dataArr.compactMap { proviceDic in
            guard let proviceDic = proviceDic as? widehallModel else { return nil }
            let proviceModel = BRProvinceModel()
            proviceModel.code = proviceDic.cad
            proviceModel.name = proviceDic.aquizzical
            proviceModel.index = dataArr.firstIndex(where: { $0 as AnyObject === proviceDic as AnyObject }) ?? 0
            let cityList = proviceDic.unending ?? []
            proviceModel.citylist = cityList.compactMap { cityDic in
                let cityModel = BRCityModel()
                cityModel.code = cityDic.cad
                cityModel.name = cityDic.aquizzical
                cityModel.index = cityList.firstIndex(where: { $0 as AnyObject === cityDic as AnyObject }) ?? 0
                let areaList = cityDic.unending ?? []
                cityModel.arealist = areaList.compactMap { areaDic in
                    let areaModel = BRAreaModel()
                    areaModel.code = areaDic.cad
                    areaModel.name = areaDic.aquizzical
                    areaModel.index = areaList.firstIndex(where: { $0 as AnyObject === areaDic as AnyObject }) ?? 0
                    return areaModel
                }
                return cityModel
            }
            return proviceModel
        }
    }
}

class OneTwoThreePopConfig {
    
    static func popLastEnum<T: widehallModel>(_ model: BRAddressPickerMode, _ label: UILabel, _ provinces: [BRProvinceModel], _ modelData: T, complete: @escaping complete) {
        let addressPickerView = BRAddressPickerView()
        addressPickerView.title = modelData.hatred ?? ""
        addressPickerView.pickerMode = model
        addressPickerView.selectIndexs = [0, 0, 0]
        addressPickerView.dataSourceArr = provinces
        addressPickerView.resultBlock = { province, city, area in
            let addressDetails = self.getAddressDetails(province: province, city: city, area: area)
            if let haddreamed = modelData.haddreamed, !haddreamed.isEmpty {
                modelData.relationText = addressDetails.addressString
                modelData.wasempty = addressDetails.code
            }else {
                modelData.butshe = addressDetails.addressString
                modelData.elemental = addressDetails.code
            }
            label.text = addressDetails.addressString
            label.textColor = UIColor.init(cssStr: "#000011")
            complete()
        }
        let customStyle = BRPickerStyle()
        customStyle.pickerColor = .white
        customStyle.pickerTextFont = UIFont(name: Bold_SFDisplay, size: 18)
        customStyle.selectRowTextColor = UIColor(cssStr: "#000011")
        addressPickerView.pickerStyle = customStyle
        addressPickerView.show()
    }
    
    private static func getAddressDetails(province: BRProvinceModel?, city: BRCityModel?, area: BRAreaModel?) -> (addressString: String, code: String) {
        let provinceName = province?.name ?? ""
        let cityName = city?.name ?? ""
        let areaName = area?.name ?? ""
        var addressString = ""
        var code = ""
        if !provinceName.isEmpty {
            addressString += provinceName
            code += province?.code ?? ""
            if !cityName.isEmpty {
                addressString += "|\(cityName)"
                code += "|\(city?.code ?? "")"
                if !areaName.isEmpty {
                    addressString += "|\(areaName)"
                    code += "|\(area?.code ?? "")"
                }
            }
        }
        return (addressString, code)
    }
}

class OnePopConfig {
    static func getOneDetails(dataSourceArr: [Any]) -> [BRProvinceModel] {
        return dataSourceArr.enumerated().compactMap { (index, item) in
            guard let province = item as? theirbeautyModel else { return nil }
            let provinceModel = BRProvinceModel()
            provinceModel.name = province.aquizzical
            provinceModel.code = province.elemental
            provinceModel.index = index
            return provinceModel
        }
    }
}

class TPopConfig {
    static func getTDetails(dataSourceArr: [Any]) -> [BRProvinceModel] {
        return dataSourceArr.compactMap { proviceDic in
            guard let proviceDic = proviceDic as? theirbeautyModel else {
                return nil
            }
            let proviceModel = BRProvinceModel()
            proviceModel.name = proviceDic.aquizzical
            proviceModel.code = proviceDic.elemental
            proviceModel.index = dataSourceArr.enumerated().first { $0.element as? theirbeautyModel === proviceDic }?.offset ?? 0
            proviceModel.citylist = proviceDic.theirbeauty?.compactMap { cityDic in
                createCityModel(from: cityDic, in: proviceDic.theirbeauty ?? [])
            } ?? []
            
            return proviceModel
        }
    }
    
    private static func createCityModel(from cityDic: theirbeautyModel, in cityList: [theirbeautyModel]) -> BRCityModel {
        let cityModel = BRCityModel()
        cityModel.name = cityDic.aquizzical
        cityModel.code = cityDic.elemental
        cityModel.index = cityList.enumerated().first { $0.element === cityDic }?.offset ?? 0
        cityModel.arealist = cityDic.theirbeauty?.compactMap { areaDic in
            createAreaModel(from: areaDic, in: cityDic.theirbeauty ?? [])
        } ?? []
        return cityModel
    }
    
    private static func createAreaModel(from areaDic: theirbeautyModel, in areaList: [theirbeautyModel]) -> BRAreaModel {
        let areaModel = BRAreaModel()
        areaModel.name = areaDic.aquizzical
        areaModel.code = areaDic.elemental
        areaModel.index = areaList.enumerated().first { $0.element === areaDic }?.offset ?? 0
        return areaModel
    }
}


class LLJieURL {
    static func appendters(url: String, parameters: [String: String]) -> String? {
        guard var urlComponents = URLComponents(string: url) else {
            return nil
        }
        let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
        return urlComponents.url?.absoluteString
    }
}
