import 'package:flutter/material.dart';
import 'package:flutter_trexis_app/views/lunch_learn_program_card.dart';
import 'package:flutter_trexis_app/views/recent_lunch_learn_program_card.dart';

import '../models/lunch_learn_program.dart';

class JobHomePage extends StatelessWidget {
  JobHomePage({Key? key}) : super(key: key);

  final List<LLProgram> llPrograms = [
    LLProgram(
      topicName: 'Reactive Programing Java',
      hostsName: 'Noah',
      logoImage: 'images/trexis_logo.png',
      noOfHours: 1.3,
    ),
    LLProgram(
      topicName: 'Java Stream API',
      hostsName: 'Charles',
      logoImage: 'images/trexis_logo.png',
      noOfHours: 1.5,
    ),
    LLProgram(
      topicName: 'FINITE',
      hostsName: 'Rex, Hendrix',
      logoImage: 'images/trexis_logo.png',
      noOfHours: 1.1,
    ),
  ];

  final List<LLProgram> recentLlPrograms = [
    LLProgram(
      topicName: 'Contactless Payments Visa',
      hostsName: 'Vito, Craig',
      logoImage: 'images/trexis_logo.png',
      noOfHours: 1.0,
    ),
    LLProgram(
      topicName: 'September LL Program',
      hostsName: 'Don\'t know who',
      logoImage: 'images/trexis_logo.png',
      noOfHours: 1.2,
    ),
    LLProgram(
      topicName: 'October LL Program',
      hostsName: 'Maybe Him, Or someone',
      logoImage: 'images/trexis_logo.png',
      noOfHours: 1.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // menu icon
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: Icon(Icons.menu_rounded, size: 40),
            ),

            // space
            SizedBox(height: 24),

            // heading title text
            Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Discover What\'s happening in TreXis",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    textBaseline: TextBaseline.ideographic),
              ),
            ),

            // space
            SizedBox(height: 24),

            // search text field and filter button
            Row(
              children: [
                // search text field
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 24, right: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey[400]!,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),

                // space
                SizedBox(width: 1),

                // filter button container
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.filter_list_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // space
            SizedBox(height: 40),

            // things happening title text
            Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "L & L Programs Happening",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),

            // space
            SizedBox(height: 12),

            // list of ll programs
            Container(
              height: 144,
              child: ListView.builder(
                itemCount: this.llPrograms.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return LunchLearnProgramCard(
                    thing: this.llPrograms[index],
                  );
                },
              ),
            ),

            // space
            SizedBox(height: 44),

            // Recent LL programs title
            Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Recently Added Programs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),

            // space
            SizedBox(height: 24),

            // list of recent ll programs
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: this.recentLlPrograms.length,
                  itemBuilder: (context, index) {
                    return RecentLLProgramCard(thing: this.recentLlPrograms[index],);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
