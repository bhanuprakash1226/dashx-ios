import Foundation

public struct Preference: Codable {
    public var enabled: Bool?
    public var email: Bool?
    public var push: Bool?
    public var sms: Bool?
    public var whatsapp: Bool?
}

public struct PrepareAssetResponse: Codable {
    public var id: String?
    public var data: AssetData?
}

public struct AssetData: Codable {
    public var asset: UploadData?
    public var upload: UploadData?
}

public enum UploadData: Codable {
    case gcs(GCSUploadData)
    case mux(MuxUploadData)
}

public struct GCSUploadData: Codable {
    public var url: String?
    public var headers: [String: String]?
}

public struct MuxUploadData: Codable {
    public var status: String?
    public var url: String?
    public var playbackIds: [MuxPlaybackData]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case url
    }
}

public struct MuxPlaybackData: Codable {
    public var id: String?
    public var policy: String?
}

//public struct AssetResponse: Codable {
//    public var uploadStatus: String?
//    public var data: AssetData?
//}

public struct AssetResponse: Codable {
    public struct AssetDataResponse: Codable {
        public var assetData: AssetData?
        
        enum CodingKeys: String, CodingKey {
            case assetData = "asset"
        }
    }
    
    public var uploadStatus: String?
    public var data: AssetDataResponse?
}
