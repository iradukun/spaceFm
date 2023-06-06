class RadioStation {
  final String documentId;
  final String info;
  final String location;
  final String name;
  final String streamingLink;

  RadioStation({
    required this.documentId,
    required this.info,
    required this.location,
    required this.name,
    required this.streamingLink,
  });

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      documentId: json['documentId'],
      info: json['info'],
      location: json['locatioon'],
      name: json['name'],
      streamingLink: json['streamingLink'],
    );
  }

  static List<RadioStation> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => RadioStation.fromJson(json)).toList();
  }
}