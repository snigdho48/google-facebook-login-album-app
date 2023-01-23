import 'package:flutter/material.dart';

import '../util/justified_text.dart';

class Iteam_card extends StatelessWidget {
  final String title, subtitle, image;
  const Iteam_card({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/detail',
            arguments: ({
              'title': title,
              'subtitle': subtitle,
              'image': image
            }));
      },
      child: Column(
        children: [
          Image.asset(
            'assets/images/$image',
            fit: BoxFit.fill,
            width: size.width / 3.2,
            height: (size.width / 3.2) * 1.5,
          ),
          Container(
              padding: const EdgeInsets.all(5),
              width: size.width / 3.2,
              height: 70,
              color: Colors.black,
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
