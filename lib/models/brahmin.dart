import 'dart:convert';

class Brahman {
  String brahmanId;
  String name;
  String phone;
  String address;
  double lat;
  double long;
  Brahman({
    this.brahmanId,
    this.name,
    this.phone,
    this.address,
    this.lat,
    this.long,
  });

  Brahman copyWith({
    String brahminId,
    String name,
    String phone,
    String otp,
    String address,
    double lat,
    double long,
  }) {
    return Brahman(
      brahmanId: brahmanId ?? this.brahmanId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brahmanId': brahmanId,
      'name': name,
      'phone': phone,
      'address': address,
      'lat': lat,
      'long': long,
    };
  }

  factory Brahman.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Brahman(
      brahmanId: map['brahmanId'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      lat: map['lat'],
      long: map['long'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Brahman.fromJson(String source) =>
      Brahman.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Brahman(name: $name, brahmanId: $brahmanId, phone: $phone, address: $address, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Brahman &&
        o.name == name &&
        o.brahmanId == brahmanId &&
        o.phone == phone &&
        o.address == address &&
        o.lat == lat &&
        o.long == long;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        brahmanId.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        lat.hashCode ^
        long.hashCode;
  }
}
