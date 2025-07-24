import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_o/utils/app_colors.dart';

import '../utils/dimens.dart';

class AddMaterialPage extends StatelessWidget {
  const AddMaterialPage({Key? key}) : super(key: key);

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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: AppDimens.marginPaddingMedium,
          right: AppDimens.marginPaddingMedium,
          left: AppDimens.marginPaddingMedium,
          bottom: AppDimens.marginPaddingLarge,
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              const EdgeInsets.all(AppDimens.marginPaddingExtraLarge)
            )
          ),
          onPressed: () {}, 
          child: Text(
            'Create',
            style: TextStyle(
              fontSize: 20
            ),
          )
        ),
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
                      Text('Material Title', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'ASDasdasds'
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Material Description', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 10,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Masukan ini'
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