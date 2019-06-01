import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobber/data/skill.dart';

import '../utils.dart';
import 'organization.dart';

class Job {
  static const DESC = 'description';
  String desc;

  static const LEVEL = 'level';
  String level;

  static const LOCATION = 'location';
  String location;

  static const QUALIFICATION = 'qualification';
  String qualification;

  static const ORGANIZATION = 'organization';
  Map<dynamic, dynamic> organization;
  Organization org = Organization();

  static const TITLE = 'title';
  String title;

  static const STATUS = 'status';
  String status;

  static const TYPE = 'type';
  String type;

  static const SKILLS = 'skills';
  List<Skill> skills = List();

  Job();

  Job.fromDocument(DocumentSnapshot document) {
    this.qualification = getValueOrEmpty(document, QUALIFICATION);
    this.type = getValueOrEmpty(document, TYPE);
    this.status = getValueOrEmpty(document, STATUS);
    this.title = getValueOrEmpty(document, TITLE);
    this.qualification = getValueOrEmpty(document, QUALIFICATION);
    this.desc = getValueOrEmpty(document, DESC);
    this.level = getValueOrEmpty(document, LEVEL);
    this.location = getValueOrEmpty(document, LOCATION);
    this.organization = document[ORGANIZATION];
    this.org = Organization.fromMap(organization);
    Map<dynamic, dynamic> skills = document[SKILLS];
    this.skills.clear();
    skills.forEach((k,v){
      this.skills.add(Skill.fromMap(v));
    });

  }
}
