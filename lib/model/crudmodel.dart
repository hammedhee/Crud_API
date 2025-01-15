class Crudmodel {
  String? id;
  String? name;
  String? position;
  String? phonenumber;

  Crudmodel(
      {this.id,
      required this.name,
      required this.position,
      required this.phonenumber});

  factory Crudmodel.fromJson(Map<String, dynamic> json) => Crudmodel(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      phonenumber: json['phonenumber']);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'position': position,
      'phonenumber': phonenumber,
      'id': id,
    };
  }
}
