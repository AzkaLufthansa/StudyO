import 'package:flutter/material.dart' hide MaterialState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_o/cubit/material/material_cubit.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/models/material_model.dart';
import 'package:study_o/utils/app_colors.dart';

class Material extends StatefulWidget {
  const Material({super.key});

  @override
  State<Material> createState() => _MaterialState();
}

class _MaterialState extends State<Material> {
  late String classroomId;

  @override
  void initState() {
    super.initState();

    classroomId = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaterialCubit>(
      create: (_) => sl<MaterialCubit>()..fetchMyMaterials(classroomId: classroomId),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: const Text('Learn'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MaterialCubit, MaterialState>(
                builder: (context, state) {
                  if (state is MaterialSuccess) {
                    return ListView.builder(
                      itemCount: state.material.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MaterialCard(
                          data: state.material[index],
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action when button is pressed
            Get.toNamed('/add_material');
          },
          child: Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 105, 1, 114),
        ),
      ),
    );
  }
}

class MaterialCard extends StatelessWidget {
  final MaterialModel data;

  const MaterialCard({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
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
                Text(data.title, style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text(
                  data.title,
                  overflow: TextOverflow.fade,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}