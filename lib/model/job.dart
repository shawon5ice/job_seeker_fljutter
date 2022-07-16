class Job {
	String? jobTitle;
	String? deadline;
	String? recruitingCompanySProfile;
	JobDetails? jobDetails;
	String? logo;
	bool? isFeatured;
	int? minExperience;
	int? maxExperience;
	String? minSalary;
	String? maxSalary;

	Job({this.jobTitle, this.deadline, this.recruitingCompanySProfile, this.jobDetails, this.logo, this.isFeatured, this.minExperience, this.maxExperience, this.minSalary, this.maxSalary});

	Job.fromJson(Map<String, dynamic> json) {
		jobTitle = json['jobTitle'];
		deadline = json['deadline'];
		recruitingCompanySProfile = json['recruitingCompany\'sProfile'];
		jobDetails = json['jobDetails'] != null ? JobDetails.fromJson(json['jobDetails']) : null;
		logo = json['logo'];
		isFeatured = json['IsFeatured'];
		minExperience = json['minExperience'];
		maxExperience = json['maxExperience'];
		minSalary = json['minSalary'];
		maxSalary = json['maxSalary'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['jobTitle'] = jobTitle;
		data['deadline'] = deadline;
		data['recruitingCompany\'sProfile'] = recruitingCompanySProfile;
		if (jobDetails != null) {
      data['jobDetails'] = jobDetails!.toJson();
    }
		data['logo'] = logo;
		data['IsFeatured'] = isFeatured;
		data['minExperience'] = minExperience;
		data['maxExperience'] = maxExperience;
		data['minSalary'] = minSalary;
		data['maxSalary'] = maxSalary;
		return data;
	}
}

class JobDetails {
	String? title;
	String? lastDate;
	String? companyName;
	String? applyInstruction;

	JobDetails({this.title, this.lastDate, this.companyName, this.applyInstruction});

	JobDetails.fromJson(Map<String, dynamic> json) {
		title = json['Title'];
		lastDate = json['LastDate'];
		companyName = json['CompanyName'];
		applyInstruction = json['ApplyInstruction'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['Title'] = title;
		data['LastDate'] = lastDate;
		data['CompanyName'] = companyName;
		data['ApplyInstruction'] = applyInstruction;
		return data;
	}
}
