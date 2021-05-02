class SubCategoryResponse {
  int? _responseCode;
  Response_data? _responseData;
  String? _comments;
  bool? _status;
  String? _env;

  int? get responseCode => _responseCode;
  Response_data? get responseData => _responseData;
  String? get comments => _comments;
  bool? get status => _status;
  String? get env => _env;

  SubCategoryResponse({
      int? responseCode, 
      Response_data? responseData, 
      String? comments, 
      bool? status, 
      String? env}){
    _responseCode = responseCode;
    _responseData = responseData;
    _comments = comments;
    _status = status;
    _env = env;
}

  SubCategoryResponse.fromJson(dynamic json) {
    _responseCode = json["response_code"];
    _responseData = json["response_data"] != null ? Response_data.fromJson(json["response_data"]) : null;
    _comments = json["comments"];
    _status = json["status"];
    _env = json["env"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["response_code"] = _responseCode;
    if (_responseData != null) {
      map["response_data"] = _responseData?.toJson();
    }
    map["comments"] = _comments;
    map["status"] = _status;
    map["env"] = _env;
    return map;
  }

}

class Response_data {
  List<Data>? _data;

  List<Data>? get data => _data;

  Response_data({
      List<Data>? data}){
    _data = data;
}

  Response_data.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  String? _subcatId;
  String? _catId;
  String? _subcategory;
  String? _status;
  String? _title;
  dynamic? _description;
  String? _imagePath;
  String? _unicode;
  dynamic? _height;
  dynamic? _width;
  dynamic? _createdBy;
  String? _createdAt;

  String? get subcatId => _subcatId;
  String? get catId => _catId;
  String? get subcategory => _subcategory;
  String? get status => _status;
  String? get title => _title;
  dynamic? get description => _description;
  String? get imagePath => _imagePath;
  String? get unicode => _unicode;
  dynamic? get height => _height;
  dynamic? get width => _width;
  dynamic? get createdBy => _createdBy;
  String? get createdAt => _createdAt;

  Data({
      String? subcatId, 
      String? catId, 
      String? subcategory, 
      String? status, 
      String? title, 
      dynamic? description, 
      String? imagePath, 
      String? unicode, 
      dynamic? height, 
      dynamic? width, 
      dynamic? createdBy, 
      String? createdAt}){
    _subcatId = subcatId;
    _catId = catId;
    _subcategory = subcategory;
    _status = status;
    _title = title;
    _description = description;
    _imagePath = imagePath;
    _unicode = unicode;
    _height = height;
    _width = width;
    _createdBy = createdBy;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _subcatId = json["subcat_id"];
    _catId = json["cat_id"];
    _subcategory = json["subcategory"];
    _status = json["status"];
    _title = json["title"];
    _description = json["description"];
    _imagePath = json["image_path"];
    _unicode = json["unicode"];
    _height = json["height"];
    _width = json["width"];
    _createdBy = json["created_by"];
    _createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["subcat_id"] = _subcatId;
    map["cat_id"] = _catId;
    map["subcategory"] = _subcategory;
    map["status"] = _status;
    map["title"] = _title;
    map["description"] = _description;
    map["image_path"] = _imagePath;
    map["unicode"] = _unicode;
    map["height"] = _height;
    map["width"] = _width;
    map["created_by"] = _createdBy;
    map["created_at"] = _createdAt;
    return map;
  }

}