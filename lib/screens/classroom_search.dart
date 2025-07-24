import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';

import '../utils/dimens.dart';

class ClassroomSearch extends StatelessWidget {
  const ClassroomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Search Classroom'),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: IconButton(
              icon: Icon(Icons.question_mark_rounded),
              color: AppColors.primaryColor,
              onPressed: () {Get.toNamed('/tutorial');},
            ),
          )
        ],
      ),
      
      body: Container(
        margin: const EdgeInsets.all(AppDimens.marginPaddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge, // Ensures ripple stays within rounded edges
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Programming 101'
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Result:', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
      
            SizedBox(height: 20
            
            ), // Add some spacing
            
            // Added TextFormField for search functionality
            
      
          ],
        ),
      ),
    );
  }


  
}