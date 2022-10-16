class SaveJobRequest {
  String jobId;
  bool isSave;

  SaveJobRequest({required this.jobId, required this.isSave});

  Map<String, dynamic> get toJson => {'jobId': jobId, 'isSave': isSave};
}
