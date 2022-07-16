import 'package:bloc_pattern/bloc/job_seeker/job_seeker_bloc.dart';
import 'package:bloc_pattern/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spinkit = Center(
      child: SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      ),
    );

    return BlocBuilder<JobSeekerBloc, JobSeekerState>(
        builder: ((context, state) {
      if (state is JobSeekerInitial) {
        return spinkit;
      }
      if (state is JobSeekerLoading) {
        return spinkit;
      }
      if (state is JobSeekerLoaded) {
        final jobs = state.jobs;
        return ListView.builder(
          itemCount: state.jobs.length,
          itemBuilder: (context, index) {
            return JobCardItem(job: jobs[index],isDetails: false,index:index.toString());
          },
        );
      }
      if (state is JobSeekerError) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return const Center(
          child: Text('Unknown state'),
        );
      }
    }));
  }
}
