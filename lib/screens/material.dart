import 'package:flutter/material.dart' hide MaterialState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study_o/cubit/material/material_cubit.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/models/material_model.dart';
import 'package:study_o/utils/app_colors.dart';
import 'package:study_o/utils/dimens.dart';
import 'package:study_o/widgets/learn_modal.dart';

class Material extends StatefulWidget {
  const Material({super.key});

  @override
  State<Material> createState() => _MaterialState();
}

class _MaterialState extends State<Material> {
  late String classroomId;
  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();

    classroomId = Get.arguments;
  }

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
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
        body: BlocBuilder<MaterialCubit, MaterialState>(
          builder: (context, _) {
            return SmartRefresher(
              controller: _refreshController,
              onRefresh: () {
                BlocProvider.of<MaterialCubit>(context).fetchMyMaterials(classroomId: classroomId);

                _refreshController.refreshCompleted();
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppDimens.marginPaddingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<MaterialCubit, MaterialState>(
                      builder: (context, state) {
                        if (state is MaterialLoading) {
                          return Center(child: const CircularProgressIndicator());
                        } else if (state is MaterialFailure) {
                          return Center(child: Text('Error: ${state.errMessage}'));
                        } else if (state is MaterialSuccess) {
                          if (state.material.isEmpty) {
                            return Text('Material is still empty!');
                          }
                          
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
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action when button is pressed
            Get.toNamed('/add_material', arguments: classroomId);
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
            showDialog(
                  context: context, 
                  builder: (_) {
                    return LearnModal();
                  }
                );
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