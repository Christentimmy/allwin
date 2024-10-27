class BookingModel {
  final int id;
  final String bookingCode;
  final String platform;
  final String totalOdd;
  final String startDate;
  final String endDate;
  final String status;
  final String result;
  final String createdAt;
  final String updatedAt;

  BookingModel({
    required this.id,
    required this.bookingCode,
    required this.platform,
    required this.totalOdd,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json["id"] ?? 0,
      bookingCode: json["booking_code"] ?? "",
      platform: json["platform"] ?? "",
      totalOdd: json["total_odd"] ?? "",
      startDate: json["start_date"] ?? "",
      endDate: json["end_date"] ?? "",
      status: json["status"] ?? "",
      result: json["result"] ?? "",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
    );
  }
}
