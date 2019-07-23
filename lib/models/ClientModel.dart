import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id;
  String brandName;
  String sizeName;
  int chest;

  Client({
    this.id,
    this.brandName,
    this.sizeName,
    this.chest,
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
    id: json["id"],
    brandName: json["brand_name"],
    sizeName: json["size_name"],
    chest: json["chest"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "brand_name": brandName,
    "size_name": sizeName,
    "chest": chest,
  };
}
