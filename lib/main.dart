import 'package:bloc_pattern/bloc/job_seeker/job_seeker_imports.dart';
import 'package:bloc_pattern/repositories/job_repository/job_repository.dart';
import 'package:bloc_pattern/repositories/job_repository/jobs_api_client.dart';
import 'package:bloc_pattern/screens/job_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobSeekerBloc(
          repository: JobsRepository(
              apiClient: JobsApiClient(httpClient: http.Client())))
        ..add(
          const FetchJobs(),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: generatedRoute,
        title: 'JOB Seeker',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('JOB Seeker'),
            ),
            body: const JobListPage()),
      ),
    );
  }

// Route generatedRoute(RouteSettings settings){
//     switch(settings.name){
//       case '/':
//         return MaterialPageRoute(builder: (context) => JobListPage());
//       case '/job_details':
//         final job = settings.arguments as Job;
//         return MaterialPageRoute(builder: (context) => JobDetailsPage(job: job));
//       default:
//         return MaterialPageRoute(builder: (context) => JobListPage());
//     }
//   }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print(transition);
  }
}
