class SummaryGitHubPost{
  String gitHub = "";
  String summary = "";
  String firstName = "";
  String lastName = "";
  String phone = "";
  String email = "";

  Map<String, dynamic> toJson(){
    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'phone' : phone,
      'email' : email,
      'githubProfileUrl' : gitHub,
      'summary' : summary
    };
  }
}