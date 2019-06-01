import 'package:flutter/material.dart';
import 'package:jobber/data/data_loader.dart';
import 'package:jobber/data/jobs.dart';
import 'package:jobber/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

import 'job_details.dart';

class JobList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BaseDataLoader model = Provider.of(context);
    if (model.allJobs.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    // return Column(children: model.allJobs.map((job) {
    //   return ;
    // }));

    List<Job> jobs = model.allJobs.toList();

    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (_, int index){
        Job job = jobs[index];
        return InkWell(
          child: jobListItemWidget(job),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_){return JobDetails(job);}));
          },
        );
      },
    );
  }
}
