import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Job {
  Job(this.company, this.title);

  final String company;
  final String title;
}

class GitHubJobs extends StatefulWidget {
  @override
  _GitHubJobsState createState() => _GitHubJobsState();
}

class _GitHubJobsState extends State<GitHubJobs> {
  List<Job> jobData = [];

  Future<List> getJobs() async {
    var url =
        Uri.parse('https://jobs.github.com/positions.json?location=remote');

    var response = await http.get(url);
    List result = json.decode(response.body);
    print(result.runtimeType);
    result.forEach((element) {
      String company = element['company'];
      String title = element['title'];
      jobData.add(Job(company, title));
    });
    jobData.forEach((element) {
      print(element.company);
      print(element.title);
    });
    return jobData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Jobs'),
      ),
      body: Center(
        child: Text('Jobs'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call),
        onPressed: getJobs,
      ),
    );
  }
}
