import 'package:bloc_pattern/model/job.dart';
import 'jobs_api_client.dart';

class JobsRepository {
  final JobsApiClient apiClient;

  JobsRepository({required this.apiClient});

  Future<List<Job>> fetchJobs() async {
    return await apiClient.fetchJobs();
  }
}
