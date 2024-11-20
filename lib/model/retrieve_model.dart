class RetrieveModel {
  final int id;
  final String name;
  final String email;
  final int verified;
  final String status;

  RetrieveModel({
    required this.id,
    required this.name,
    required this.email,
    required this.verified,
    required this.status,
  });

  factory RetrieveModel.fromJson(var json) {
    return RetrieveModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      verified: json["verified"],
      status: json["status"],
    );
  }
}
