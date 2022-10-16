class ApplyJobResquest {
  int cvId;
  int jobId;

  ApplyJobResquest({required this.cvId, required this.jobId});

  Map<String, dynamic> get toJson => {'cvId': cvId, 'jobId': jobId};
}
