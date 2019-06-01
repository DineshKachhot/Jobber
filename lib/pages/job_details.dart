import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobber/data/data_loader.dart';
import 'package:jobber/data/jobs.dart';
import 'package:jobber/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class JobDetails extends StatelessWidget {

  final Job job;

  JobDetails(this.job);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            color: Colors.redAccent.withAlpha(70),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: roundCircleIconWidget(92, job.org.logo),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 32, left: 32, bottom: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Type"),
                            Text(job.type,
                                style: Theme.of(context).textTheme.subtitle),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Level"),
                            Text(job.level,
                                style: Theme.of(context).textTheme.subtitle),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Location"),
                            Text(job.location,
                                style: Theme.of(context).textTheme.subtitle),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 32,
                ),
                Text(job.org.name, style: Theme.of(context).textTheme.subtitle),
                Text(
                  job.title,
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 32,
                ),
                Text("Description",
                    style: Theme.of(context).textTheme.subtitle),
                SizedBox(
                  height: 8,
                ),
                Text(job.desc),
                SizedBox(
                  height: 32,
                ),
                Text("Qualification",
                    style: Theme.of(context).textTheme.subtitle),
                SizedBox(
                  height: 8,
                ),
                Text(job.qualification),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
