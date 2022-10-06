import 'package:flutter/material.dart';
import 'package:recruit_app/domain/model/cv/cv_model.dart';
import 'package:recruit_app/presentation/list_cv/bloc/cv_cubit.dart';
import 'package:recruit_app/presentation/list_cv/ui/widget/cv_widget.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/drawer/drawer_slide.dart';
import 'package:recruit_app/widget/menu/menu.dart';

class ListCVScreen extends StatefulWidget {
  const ListCVScreen({Key? key}) : super(key: key);

  @override
  State<ListCVScreen> createState() => _ListCVScreenState();
}

class _ListCVScreenState extends State<ListCVScreen> {
  final CVCubit cubit = CVCubit();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConst.danh_sach_cv,
        leading: GestureDetector(
            onTap: () {
              DrawerSlide.navigatorSlide(
                  context: context, screen: const MenuWidget());
            },
            child: const Icon(Icons.menu)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder<List<CVModel>>(
            stream: cubit.cvSubject.stream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? [];

              return Column(
                children: data
                    .map(
                        (e) => CVWidget(editCV: () {}, deleteCV: () {
                          cubit.deleteCV(e);
                        }, model: e))
                    .toList(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: colorPrimary3,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
