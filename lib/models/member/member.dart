class Member {
  int id;
  String name;
  String? email;
  String? phone;
  String? website;
  Address? address;
  Company? company;

  Member(
      {required this.id,
      required this.name,
      this.email,
      this.phone,
      this.address,
      this.website,
      this.company});

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        website: json["website"],
        address: Address(
            street: json["address"]["street"],
            suite: json["address"]["suite"],
            city: json["address"]["city"],
            zipcode: json["address"]["zipcode"]),
        company: Company(
            name: json["company"]["name"],
            catchPhrase: json["company"]["catchPhrase"],
            bs: json["company"]["bs"]),
      );
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;

  Address({this.street, this.suite, this.city, this.zipcode});
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({this.name, this.catchPhrase, this.bs});
}
