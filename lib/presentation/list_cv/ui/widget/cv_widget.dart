import 'package:flutter/material.dart';
import 'package:recruit_app/presentation/detail_cv/ui/detail_cv_screen.dart';
import 'package:recruit_app/until/const/color.dart';
import 'package:recruit_app/until/extension/date_time.dart';
import 'package:recruit_app/until/extension/string.dart';

import '../../../../data/response/cv/cv_response.dart';

class CVWidget extends StatelessWidget {
  final Function() editCV;
  final Function() deleteCV;
  final Function(dynamic) thenPop;
  final CvDataResponse model;

  const CVWidget(
      {Key? key,
      required this.editCV,
      required this.deleteCV,
      required this.model, required this.thenPop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailCVScreen(id: model.id ?? 0))).then(thenPop);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 56,
                  spreadRadius: 0,
                  color: const Color(0xFF5875AC).withOpacity(0.08)),
              BoxShadow(
                  offset: const Offset(0, 12),
                  blurRadius: 16,
                  spreadRadius: 0,
                  color: const Color(0xFF5875AC).withOpacity(0.08)),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  (model.createdat ?? '').convertStringToDate.formatDdMMYYYY,
                ),
              ],
            )),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                (model.isprimary ?? false)
                    ? Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      )
                    : Container(),
                GestureDetector(
                  onTap: editCV,
                  child: const Icon(
                    Icons.edit,
                    color: colorPrimary1,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: deleteCV,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
