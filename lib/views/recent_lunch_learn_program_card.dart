import 'package:flutter/material.dart';
import 'package:flutter_trexis_app/models/lunch_learn_program.dart';

class RecentLLProgramCard extends StatelessWidget {
  final LLProgram thing;

  const RecentLLProgramCard({required this.thing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 52,
            margin: EdgeInsets.only(left: 4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black38,
                width: 2,
              ),
            ),
            child: Image.asset(thing.logoImage),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  thing.topicName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  thing.hostsName,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(16, 16),
                topRight: Radius.elliptical(16, 16),
              ),
              color: Colors.green[400]
            ),
            child: Text(
              '•̐' + thing.noOfHours.toString() + 'Hrs',
              style: TextStyle(
                letterSpacing: 1.6
              ),
            ),
          )
        ],
      ),
    );
  }
}
