import 'package:flutter/material.dart';

class JobCompanyWidget extends StatelessWidget {
  final String image;
  final String title;
  final String rangeSalary;
  final String address;

  const JobCompanyWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.rangeSalary,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    rangeSalary,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    address,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            flex: 7,
          ),
        ],
      ),
    );
  }
}
