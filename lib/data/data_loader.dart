import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobber/data/skill.dart';

import 'jobs.dart';

final String COLLECTION_SKILLS = "skills";
final String COLLECTION_JOBS = "jobs";

class BaseDataLoader extends ChangeNotifier {
  bool loading = false;

  BaseDataLoader() {
    print("BaseDataLoader");
    fetchData();
  }

  StreamSubscription<QuerySnapshot> _aliasedDataSub;
  StreamSubscription<QuerySnapshot> _jobsDataSub;

  final List<Skill> _allSkill = <Skill>[];
  Iterable<Skill> get allSkill => _allSkill;

  final List<Job> _allJobs = <Job>[];
  Iterable<Job> get allJobs => _allJobs;

  void fetchData() async {
    loading = true;
    notifyListeners();


    Query aliasedDataQuery = Firestore.instance.collection(COLLECTION_SKILLS);
    _aliasedDataSub = aliasedDataQuery.snapshots().listen((event) {
      _allSkill.clear();
      event.documents.forEach((document) {
        _allSkill.add(Skill.fromDocument(document));
      });
      print('Skills Count - ${_allSkill.length}');
      loading = false;
      notifyListeners();
    });

    Query jobsDataQuery = Firestore.instance.collection(COLLECTION_JOBS);
    _jobsDataSub = jobsDataQuery.snapshots().listen((event) {
      _allJobs.clear();
      event.documents.forEach((document) {
        _allJobs.add(Job.fromDocument(document));
        print('Jobs Count - ${_allJobs[0].org.name}');
        print('Jobs Count - ${_allJobs[0].skills.length}');
      });
      print('Jobs Count - ${_allJobs.length}');
      loading = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _aliasedDataSub.cancel();
    _aliasedDataSub = null;
    super.dispose();
  }

}
