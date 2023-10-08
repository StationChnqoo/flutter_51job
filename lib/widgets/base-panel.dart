import 'package:flutter/material.dart';
import 'package:flutter_51job/models/SimpleKeyValue.dart';
import 'package:flutter_51job/widgets/common-card.dart';

class BasePanel extends StatelessWidget {
  final data;
  BasePanel({required this.data});

  String buildOSS(String icon) =>
      'https://cdn.cctv3.net/net.cctv3.51Job/${icon}';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CommonCard(
        child: Column(
      children: [
        Row(
          children: [
            PhysicalModel(
              color: Colors.white,
              elevation: 4,
              borderRadius: BorderRadius.circular(39),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(39),
                // 'https://cdn.cctv3.net/net.cctv3.51Job/i-Google.jpg',
                child: Image.asset(
                  'assets/i.jpg',
                  height: 78,
                  width: 78,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: SizedBox(
              height: 78,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '孙宇鹏',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      // fontWeight: FontWeight.w500
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/lcu.jpg',
                            height: 20, width: 20),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '聊城大学 · 软件工程 · 本科 (2019年毕业）',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      )
                    ],
                  ),
                  Text(
                    data?['intent'] ?? '',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...SimpleKeyValue.loadConnects().map((e) => Container(
                      child: Row(
                        children: [
                          Text(
                            e.value,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.618),
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Image.asset(e.icon,
                              height: 16,
                              width: 16,
                              color: Theme.of(context).primaryColor)
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...(data['skills'] as List).asMap().entries.map((e) => Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  // margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      Image.network(
                        buildOSS(e.value['icon']),
                        color: Theme.of(context).primaryColor,
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        e.value['text'],
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12),
                      )
                    ],
                  ),
                ))
          ],
        )
      ],
    ));
  }
}
