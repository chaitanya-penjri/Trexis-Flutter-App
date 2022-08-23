import 'package:flutter/material.dart';
import 'package:flutter_trexis_app/models/lunch_learn_program.dart';

class LunchLearnProgramCard extends StatelessWidget {
  final LLProgram thing;

  const LunchLearnProgramCard({required this.thing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 280,
          padding: EdgeInsets.all(12),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 52,
                    child: Image.asset(
                      thing.logoImage,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      thing.noOfHours.toString() + ' Hours',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                thing.topicName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('Presented By ' + thing.hostsName.toString() + ' People')
            ],
          ),
        ),
      ),
    );
  }
}
