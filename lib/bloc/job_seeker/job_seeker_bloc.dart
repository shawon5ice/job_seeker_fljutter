import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/model/job.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/job_repository/job_repository.dart';

part 'job_seeker_event.dart';
part 'job_seeker_state.dart';

class JobSeekerBloc extends Bloc<JobSeekerEvent, JobSeekerState> {
  final JobsRepository repository;

  JobSeekerBloc({required this.repository}) : super(JobSeekerInitial()) {
    
    on<FetchJobs>((event, emit) async {
      // Timer(Duration(seconds: 1), () {
      //   emit(JobSeekerLoading());
      // });

      try {
        emit(JobSeekerLoading());
        final mList = await repository.fetchJobs();
        emit(JobSeekerLoaded(jobs: mList));

      } on Exception catch (e) {
        emit(JobSeekerError(error: e.toString()));
      }
    });
  }
}
