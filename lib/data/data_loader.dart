import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobber/data/skill.dart';

final String COLLECTION_SKILLS = "skills";

class BaseDataLoader extends ChangeNotifier {
  bool loading = false;

  BaseDataLoader() {
    print("BaseDataLoader");
    fetchData();
  }

  StreamSubscription<QuerySnapshot> _aliasedDataSub;

  final List<Skill> _allSkill = <Skill>[];

  Iterable<Skill> get allSkill => _allSkill;

  void fetchData() async {
    loading = true;
    notifyListeners();

    // Aliased Inspection
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
  }

  @override
  void dispose() {
    _aliasedDataSub.cancel();
    _aliasedDataSub = null;
    super.dispose();
  }

}
