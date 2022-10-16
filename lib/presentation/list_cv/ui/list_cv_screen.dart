import 'package:flutter/material.dart';
import 'package:recruit_app/data/response/cv/cv_response.dart';
import 'package:recruit_app/presentation/create_cv/ui/create_cv_screen.dart';
import 'package:recruit_app/presentation/edit_cv/ui/edit_cv_screen.dart';
import 'package:recruit_app/presentation/list_cv/bloc/cv_cubit.dart';
import 'package:recruit_app/presentation/list_cv/ui/widget/cv_widget.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/widget/appbar/base_app_bar.dart';
import 'package:recruit_app/widget/drawer/drawer_slide.dart';
import 'package:recruit_app/widget/menu/menu.dart';
import 'package:recruit_app/widget/views/empty_view.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

import '../../../config/base/app_exeption.dart';

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
      body: StateStreamLayout(
        stream: cubit.streamState,
        error:
            AppException(StringConst.error, StringConst.xin_vui_long_thu_lai),
        textEmpty: StringConst.empty,
        retry: () {},
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<CVResponse>(
              stream: cubit.cvSubject.stream,
              builder: (context, snapshot) {
                final data = snapshot.data;

                return Column(
                  children: (data?.items ?? []).isNotEmpty
                      ? (data?.items ?? [])
                          .map((e) => CVWidget(
                              editCV: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditCVScreen()));
                              },
                              deleteCV: () {
                                cubit.deleteCV(e.id ?? 0);
                              },
                              model: e))
                          .toList()
                      : [
                          const EmptyView(),
                        ],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateCVSCreen())).then((value) {cubit.init();});
        },
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
