import 'package:flutter/material.dart';
import 'package:jobber/data/jobs.dart';

import '../utils.dart';

Widget chipWidget(Color bgColor, String label) {
  return Chip(
    backgroundColor: bgColor,
    label: Text(
      label,
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget jobListItemWidget(Job job) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                job.org.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "${job.title} - ${job.location}",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              ...job.skills.map((skill) {
                return chipWidget(HexColor(skill.color), skill.name);
              }).toList(),
            ],
          ),
        ),
        roundCircleIconWidget(50, job.org.logo)
      ],
    ),
  );
}

Widget roundCircleIconWidget(double size, String url) {
  return Container(
    width: size,
    height: size,
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: new NetworkImage(url),
        fit: BoxFit.cover,
      ),
      borderRadius: new BorderRadius.all(
        new Radius.circular(size),
      ),
    ),
  );
}
