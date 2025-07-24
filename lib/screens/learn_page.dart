import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Learning'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
        ],
      ),
      
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(
              width: double.infinity,
              height: 500,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge, // Ensures ripple stays within rounded edges
                child: InkWell(
                  onTap: () {
                    print('Card tapped!');
                  },
                  splashColor: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Programming Logic', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 20
            
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter a search term',
                            
                          ),
                        ),
                        SizedBox(height: 20
            
                        ),
                        Text('Programming Logic', style: TextStyle(fontSize: 18)),
                        SizedBox(height: 20
            
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter a search term',
                          ),
                        ),
                      ],
                    ),
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