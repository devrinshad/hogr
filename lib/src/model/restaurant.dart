class Restaurants {
  String? name;
  String? cuisine;
  String? price;
  double? rating;
  Location? location;
  Hours? hours;
  String? website;
  String? phoneNumber;

  Restaurants(
      {this.name,
        this.cuisine,
        this.price,
        this.rating,
        this.location,
        this.hours,
        this.website,
        this.phoneNumber});

  Restaurants.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cuisine = json['cuisine'];
    price = json['price'];
    rating = json['rating'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    hours = json['hours'] != null ? new Hours.fromJson(json['hours']) : null;
    website = json['website'];
    phoneNumber = json['phone number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cuisine'] = this.cuisine;
    data['price'] = this.price;
    data['rating'] = this.rating;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.hours != null) {
      data['hours'] = this.hours!.toJson();
    }
    data['website'] = this.website;
    data['phone number'] = this.phoneNumber;
    return data;
  }
}

class Location {
  String? address;
  String? city;
  String? state;
  String? zipCode;

  Location({this.address, this.city, this.state, this.zipCode});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip code'] = this.zipCode;
    return data;
  }
}

class Hours {
  String? open;
  String? close;

  Hours({this.open, this.close});

  Hours.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['close'] = this.close;
    return data;
  }
}

