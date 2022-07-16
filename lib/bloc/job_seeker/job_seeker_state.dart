part of 'job_seeker_bloc.dart';

abstract class JobSeekerState extends Equatable {
  const JobSeekerState();
  
  @override
  List<Object> get props => [];
}

class JobSeekerInitial extends JobSeekerState {}

class JobSeekerLoading extends JobSeekerState {}

class JobSeekerLoaded extends JobSeekerState {
  final List<Job> jobs;

  const JobSeekerLoaded({required this.jobs}) : super();

  @override
  List<Object> get props => [jobs];
}

class JobSeekerError extends JobSeekerState {
  final String error;

  const JobSeekerError({required this.error}) : super();

  @override
  List<Object> get props => [error];
}
