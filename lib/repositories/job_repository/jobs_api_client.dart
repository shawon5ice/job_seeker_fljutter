import 'dart:convert';

import 'package:bloc_pattern/model/job.dart';
import 'package:http/http.dart' as http;

class JobsApiClient {
  final _baseUrl =
      'http://corporate3.bdjobs.com/interviewtest/interviewJson.json';

  final http.Client httpClient;

  JobsApiClient({required this.httpClient});

  Future<List<Job>> fetchJobs() async {
    final response = await httpClient.get(Uri.parse(_baseUrl));

    if (response.statusCode != 200) {
      throw Exception('error getting Jobs');
    }

    final json = jsonDecode(response.body)['data'];
    final jobs = <Job>[];
    for (final x in json) {
      jobs.add(Job.fromJson(x));
    }
    return jobs;
  }
}
