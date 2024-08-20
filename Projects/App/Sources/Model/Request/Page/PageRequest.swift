struct PageRequest: BaseRequest {
    var page: Int = 1
    var size: Int = 10
    
    var params: [String : Any] {
        ["page": page,
         "size": size]
    }
}
