class YelpModel {
  List<Businesses>? businesses;
  int? total;
  Region? region;

  YelpModel({
    this.businesses,
    this.total,
    this.region,
  });

  YelpModel.fromJson(Map<String, dynamic> json) {
    businesses = (json['businesses'] as List?)
        ?.map((dynamic e) => Businesses.fromJson(e as Map<String, dynamic>))
        .toList();
    total = json['total'] as int?;
    region = (json['region'] as Map<String, dynamic>?) != null
        ? Region.fromJson(json['region'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['businesses'] = businesses?.map((e) => e.toJson()).toList();
    json['total'] = total;
    json['region'] = region?.toJson();
    return json;
  }
}

class Businesses {
  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<Categories>? categories;
  double? rating;
  Coordinates? coordinates;
  List<String>? transactions;
  String? price;
  Location? location;
  String? phone;
  String? displayPhone;
  double? distance;

  Businesses({
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClosed,
    this.url,
    this.reviewCount,
    this.categories,
    this.rating,
    this.coordinates,
    this.transactions,
    this.price,
    this.location,
    this.phone,
    this.displayPhone,
    this.distance,
  });

  Businesses.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    alias = json['alias'] as String?;
    name = json['name'] as String?;
    imageUrl = json['image_url'] as String?;
    isClosed = json['is_closed'] as bool?;
    url = json['url'] as String?;
    reviewCount = json['review_count'] as int?;
    categories = (json['categories'] as List?)
        ?.map((dynamic e) => Categories.fromJson(e as Map<String, dynamic>))
        .toList();
    rating = json['rating'] as double?;
    coordinates = (json['coordinates'] as Map<String, dynamic>?) != null
        ? Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>)
        : null;
    transactions = (json['transactions'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
    price = json['price'] as String?;
    location = (json['location'] as Map<String, dynamic>?) != null
        ? Location.fromJson(json['location'] as Map<String, dynamic>)
        : null;
    phone = json['phone'] as String?;
    displayPhone = json['display_phone'] as String?;
    distance = json['distance'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['alias'] = alias;
    json['name'] = name;
    json['image_url'] = imageUrl;
    json['is_closed'] = isClosed;
    json['url'] = url;
    json['review_count'] = reviewCount;
    json['categories'] = categories?.map((e) => e.toJson()).toList();
    json['rating'] = rating;
    json['coordinates'] = coordinates?.toJson();
    json['transactions'] = transactions;
    json['price'] = price;
    json['location'] = location?.toJson();
    json['phone'] = phone;
    json['display_phone'] = displayPhone;
    json['distance'] = distance;
    return json;
  }
}

class Categories {
  String? alias;
  String? title;

  Categories({
    this.alias,
    this.title,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    alias = json['alias'] as String?;
    title = json['title'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['alias'] = alias;
    json['title'] = title;
    return json;
  }
}

class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'] as double?;
    longitude = json['longitude'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    return json;
  }
}

class Location {
  String? address1;
  String? address2;
  String? address3;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  List<String>? displayAddress;

  Location({
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
  });

  Location.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'] as String?;
    address2 = json['address2'] as String?;
    address3 = json['address3'] as String?;
    city = json['city'] as String?;
    zipCode = json['zip_code'] as String?;
    country = json['country'] as String?;
    state = json['state'] as String?;
    displayAddress = (json['display_address'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['address1'] = address1;
    json['address2'] = address2;
    json['address3'] = address3;
    json['city'] = city;
    json['zip_code'] = zipCode;
    json['country'] = country;
    json['state'] = state;
    json['display_address'] = displayAddress;
    return json;
  }
}

class Region {
  Center? center;

  Region({
    this.center,
  });

  Region.fromJson(Map<String, dynamic> json) {
    center = (json['center'] as Map<String, dynamic>?) != null
        ? Center.fromJson(json['center'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['center'] = center?.toJson();
    return json;
  }
}

class Center {
  double? longitude;
  double? latitude;

  Center({
    this.longitude,
    this.latitude,
  });

  Center.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'] as double?;
    latitude = json['latitude'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['longitude'] = longitude;
    json['latitude'] = latitude;
    return json;
  }
}
