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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lesson Title', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Programming 101'
                        ),
                      ),
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