// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import '../model/job.dart';
import '../screens/job_details_page.dart';

class JobCardItem extends StatelessWidget {
  final Job job;
  final bool isDetails;
  final String index;
  const JobCardItem(
      {Key? key,
      required this.isDetails,
      required this.job,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          PageTransition(
              child: JobDetailsPage(
                job: job,
                index: index,
              ),
              type: PageTransitionType.rightToLeftWithFade)),
      child: Card(
        color: job.isFeatured != null && job.isFeatured == true
            ? Colors.amber
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: index,
                      child: Text(
                        job.jobTitle.toString(),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.building,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 5),
                        Text(job.recruitingCompanySProfile!.isNotEmpty
                            ? job.recruitingCompanySProfile.toString()
                            : 'Unkown'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.calendar,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 5),
                        Text(job.jobDetails!.lastDate.toString()),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      job.logo.toString(),
                      width: 50,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

class JobDetailsCard extends StatelessWidget {
  final Job job;
  final String index;
  const JobDetailsCard({super.key, required this.job, required this.index});

  @override
  Widget build(BuildContext context) {
    late String salary;
    late String experience;
    salary = salaryBuilder(job.minSalary, job.maxSalary);
    experience = experienceBuilder(job.minExperience, job.maxExperience);

    return Container(
      color: Colors.lime,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.jobTitle.toString(),
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.building,
                        size: 16,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      Text(job.recruitingCompanySProfile!.isNotEmpty
                          ? job.recruitingCompanySProfile.toString()
                          : 'Unkown'),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.briefcase,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(experience),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.clock,
                        size: 16,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      Text(job.jobDetails!.lastDate.toString()),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: index,
                    child: Image.network(
                      job.logo.toString(),
                      width: 70,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.moneyCheckDollar,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(salary),
                    ],
                  )
                ],
              ),
            ]),
      ),
    );
  }

  String salaryBuilder(String? minSalary, String? maxSalary) {
    if (minSalary!.isEmpty && maxSalary!.isEmpty) {
      return 'Negatioable';
    }
    if (minSalary.isEmpty) {
      return 'Up to ${maxSalary} Tk';
    }
    if (maxSalary!.isEmpty) {
      return '${minSalary} Tk';
    }
    return '${minSalary} - ${maxSalary} Tk';
  }

  String experienceBuilder(int? minExperience, int? maxExperience) {
    if (minExperience == null && maxExperience == null) {
      return 'NA';
    }
    if (minExperience == null) {
      return 'Up to $maxExperience Years';
    }
    if (maxExperience == null) {
      return 'At least $minExperience Years';
    }
    return '${minExperience} - ${maxExperience} Years';
  }
}
