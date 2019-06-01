

import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils.dart';

class Organization {
  static const ID = 'id';
  String id;
  static const LOGO = 'logo';
  String logo;
  static const NAME = 'name';
  String name;

  Organization.fromDocument(DocumentSnapshot document) {
    this.id = getValueOrEmpty(document, ID);
    this.logo = getValueOrEmpty(document, LOGO);
    this.name = getValueOrEmpty(document, NAME);
  }

  Organization.fromMap(Map document) {
    this.id = getValueOrEmpty(document, ID);
    this.logo = getValueOrEmpty(document, LOGO);
    this.name = getValueOrEmpty(document, NAME);
  }
}