//
//  PhotoAPI.swift
//  PhotoList
//
//  Created by 강수진 on 2019/08/03.
//  Copyright © 2019 kawoou. All rights reserved.
//

import Moya

enum PhotoApi {
    case list
    case upload(url: URL)
}

extension PhotoApi: TargetType {
    var baseURL: URL {
        return URL(string: "http://letusgo-summer-19.kawoou.kr")!
    }
    
    var path: String {
        switch self {
        case .list, .upload:
            return "/photo"
        }
    }
    
    var method: Method {
        switch self {
        case .list:
            return .get
        case .upload:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .list:
            return .requestPlain
        case .upload(url: let url):
            return .uploadMultipart([
                MultipartFormData(
                    provider: MultipartFormData.FormDataProvider.file(url),
                    name: "image"
                )
            ])
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
