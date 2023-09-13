class ResponseData {
  final String status;
  final int totalResults;
  final List<dynamic> articles;

  ResponseData(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles']
      );

}