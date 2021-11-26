protocol RemoteDatabaseServiceProtocol {
    associatedtype DataType: Codable

    func setDocument(_ data: DataType, with id: String, to path: String)
    func setBatch(_ data: [DataType], with id: String, to path: String)
    func addDocument(_ data: DataType, to path: String)
    func addBatch(_ data: [DataType], to path: String)
    func fetchCollection(from path: String) async -> [DataType]
    func fetchDocument(from path: String) async -> DataType?
    func queryCollection(from path: String, where: String, matches: String) async -> [DataType]
}
