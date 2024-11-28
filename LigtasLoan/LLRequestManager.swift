//
//  LLRequestManager.swift
//  LigtasLoan
//
//  Created by LigtasLoan on 2024/10/16.
//

import Moya
import SwiftyJSON

let h5_URL = "https://trustedsouthlending.com"

let base_URL = "\(h5_URL)/llapi"

enum APIService {
    case request(params: [String: Any]?,
                 pageURL: String,
                 method: Moya.Method)
    case uploadImage(params: [String: Any]?,
                     pageURL: String,
                     imageData: Data,
                     method: Moya.Method)
    case uploadData(params: [String: Any]?,
                    pageURL: String,
                    method: Moya.Method)
}

extension APIService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: base_URL) else { fatalError("InvalidURL")
        }
        let extendedURL = LLJieURL.appendters(url: url.absoluteString, parameters: LLDLInfo.getLogiInfo()) ?? ""
        return URL(string: extendedURL)!
    }
    
    var path: String {
        switch self {
        case .request(_, let pageURL, _),
                .uploadImage(_, let pageURL, _, _),
                .uploadData(_, let pageURL, _):
            return pageURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .request(_, _, let method),
                .uploadImage(_, _, _, let method),
                .uploadData(_, _, let method):
            return method
        }
    }
    
    var task: Task {
        switch self {
        case .request(let params, _, _):
            return .requestParameters(parameters: params ?? [:], encoding: URLEncoding.default)
            
        case .uploadImage(let params, _, let imageData, _):
            return .uploadMultipart(createMultipartFormData(params: params, imageData: imageData))
            
        case .uploadData(let params, _, _):
            return .uploadMultipart(createMultipartFormData(params: params))
        }
    }
    
    var headers: [String: String]? {
        return [
            "Accept": "application/json",
            "Connection": "keep-alive",
            "Content-Type": "application/x-www-form-urlencoded;text/javascript;text/json;text/plain;multipart/form-data"
        ]
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    private func createMultipartFormData(params: [String: Any]?, imageData: Data? = nil) -> [MultipartFormData] {
        var formData = [MultipartFormData]()
        
        if let imageData = imageData {
            formData.append(MultipartFormData(provider: .data(imageData),
                                              name: "tryst",
                                              fileName: "tryst.png",
                                              mimeType: "image/png"))
        }
        
        params?.forEach { key, value in
            if let stringValue = value as? String, let data = stringValue.data(using: .utf8) {
                formData.append(MultipartFormData(provider: .data(data), name: key))
            }
        }
        
        return formData
    }
}

class LLRequestManager: NSObject {
    
    let session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        return Session(configuration: configuration)
    }()
    
    private lazy var provider: MoyaProvider<APIService> = {
        return MoyaProvider<APIService>(session: session)
    }()
    
    private func requestData(target: APIService, completion: @escaping (Result<CommonModel, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                self.handleResponse(response, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func handleResponse(_ response: Response, completion: @escaping (Result<CommonModel, Error>) -> Void) {
        do {
            let json = try JSON(data: response.data)
            let commonModel = CommonModel(json: json)
            if commonModel.andmammy == 0 {
                completion(.success(commonModel))
            } else {
                ToastViewConfig.showToast(message: commonModel.whey)
                throw createError(from: commonModel)
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    private func createError(from commonModel: CommonModel) -> Error {
        let errorDescription = commonModel.whey
        return NSError(domain: "apierror",
                       code: commonModel.andmammy,
                       userInfo: [NSLocalizedDescriptionKey: errorDescription])
    }
    
    func uploadImageAPI(params: [String: Any]?, pageURL: String, imageData: Data, method: Moya.Method, completion: @escaping (Result<CommonModel, Error>) -> Void) {
        requestData(target: .uploadImage(params: params,
                                         pageURL: pageURL,
                                         imageData: imageData,
                                         method: method),
                    completion: completion)
    }
    
    func requestAPI(params: [String: Any]?, pageURL: String, method: Moya.Method, completion: @escaping (Result<CommonModel, Error>) -> Void) {
        requestData(target: .request(params: params,
                                     pageURL: pageURL,
                                     method: method),
                    completion: completion)
    }
    
    func uploadDataAPI(params: [String: Any]?, pageURL: String, method: Moya.Method, completion: @escaping (Result<CommonModel, Error>) -> Void) {
        requestData(target: .uploadData(params: params,
                                        pageURL: pageURL,
                                        method: method),
                    completion: completion)
    }
    
}




