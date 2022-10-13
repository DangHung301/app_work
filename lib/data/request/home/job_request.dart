class JobRequest {
  int page;
  int size;
  String search;
  String? careerId;

  JobRequest(
      {required this.page, required this.size, required this.search, this.careerId});

  Map<String, dynamic> get toJson {
    if (careerId == null) {
      return {'page': page, 'size': size, 'search': search};
    } else {
      return {
        'page': page,
        'size': size,
        'search': search,
        'careerId': careerId
      };
    }
  }
}