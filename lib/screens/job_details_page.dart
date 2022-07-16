import 'package:bloc_pattern/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../model/job.dart';

class JobDetailsPage extends StatelessWidget {
  final Job job;
  final String index;

  const JobDetailsPage({super.key, required this.job, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Job Details')),
        body: Column(
          children: [
            JobDetailsCard(
              job: job,
              index: index,
            ),
            Html(
              data: job.jobDetails!.applyInstruction,
            )
          ],
        ));
  }
}
