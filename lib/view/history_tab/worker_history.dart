import 'package:flutter/material.dart';
import 'package:user_app/variables/config.dart';
import 'package:user_app/widgets/worker_history_preview.dart';

class WorkerHistory extends StatefulWidget {
  @override
  _WorkerHistoryState createState() => _WorkerHistoryState();
}

class _WorkerHistoryState extends State<WorkerHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _bodyUI()
    );
  }

  /// body
  Widget _bodyUI() =>
      Padding(
        padding: EdgeInsets.all(dynamicSize(.04)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pendings',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: dynamicSize(.05),
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: dynamicSize(.03),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2 ,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return WorkerHistoryPreview(
                      workerName: 'Abdur Rahman',
                      workerImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiRfJ0haVsgC8i25GS374QlER2gHnOnXTmrw&usqp=CAU',
                      workingDuration: '3 hours',
                      workerCategoryName: 'Mason',
                      date: 'Jan 18, 2022',
                      amount: '2250');
                },
              ),
              Text(
                'Previous Deals',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: dynamicSize(.05),
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(
                height: dynamicSize(.03),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2 ,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return WorkerHistoryPreview(
                      workerName: 'Abdur Rahman',
                      workerImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiRfJ0haVsgC8i25GS374QlER2gHnOnXTmrw&usqp=CAU',
                      workingDuration: '3 hours',
                      workerCategoryName: 'Mason',
                      date: 'Jan 18, 2022',
                      amount: '2250');
                },
              )
            ],
          ),
        ),
      );
}
