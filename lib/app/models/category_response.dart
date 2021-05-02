class CategoryResponse {
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

  CategoryResponse({
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

  CategoryResponse.fromJson(dynamic json) {
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
    print(json);
    if (json["data"] != null) {
      // print(json["data"]);
      _data = [];
      json["data"].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }else{
      _data = [];
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
  String? _catId;
  String? _megaCatId;
  String? _megaTypeId;
  String? _title;
  String? _status;
  String? _category;
  String? _description;
  String? _imagePath;
  String? _unicode;
  String? _height;
  String? _width;
  String? _createdBy;
  String? _createdAt;

  String? get catId => _catId;
  String? get megaCatId => _megaCatId;
  String? get megaTypeId => _megaTypeId;
  String? get title => _title;
  String? get status => _status;
  String? get category => _category;
  String? get description => _description;
  String? get imagePath => _imagePath;
  String? get unicode => _unicode;
  String? get height => _height;
  String? get width => _width;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;

  Data({
      String? catId, 
      String? megaCatId, 
      String? megaTypeId, 
      String? title, 
      String? status, 
      String? category, 
      String? description, 
      String? imagePath, 
      String? unicode, 
      String? height, 
      String? width, 
      String? createdBy, 
      String? createdAt}){
    _catId = catId;
    _megaCatId = megaCatId;
    _megaTypeId = megaTypeId;
    _title = title;
    _status = status;
    _category = category;
    _description = description;
    _imagePath = imagePath;
    _unicode = unicode;
    _height = height;
    _width = width;
    _createdBy = createdBy;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _catId = json["cat_id"];
    _megaCatId = json["mega_cat_id"];
    _megaTypeId = json["mega_type_id"];
    _title = json["title"];
    _status = json["status"];
    _category = json["category"];
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
    map["cat_id"] = _catId;
    map["mega_cat_id"] = _megaCatId;
    map["mega_type_id"] = _megaTypeId;
    map["title"] = _title;
    map["status"] = _status;
    map["category"] = _category;
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