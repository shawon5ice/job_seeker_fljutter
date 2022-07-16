part of 'job_seeker_bloc.dart';

abstract class JobSeekerEvent extends Equatable {
  const JobSeekerEvent();

  @override
  List<Object> get props => [];
}

class FetchJobs extends JobSeekerEvent {
  const FetchJobs();
  
  @override
  List<Object> get props => [];
}

