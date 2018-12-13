import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class HomePage extends StatelessWidget {
  getDate(int offset) {
    return DateTime.now().add(Duration(days: offset - 365));
  }

  @override
  Widget build(BuildContext context) {
    var format = new intl.DateFormat.yMMMd();
    return Scaffold(
        appBar: AppBar(
          title: Text('Calendar App'),
        ),
        body: PageView.builder(
          controller: PageController(
            initialPage: 365
          ),
          itemBuilder: (BuildContext context, int index) {
            print(index.toString());
            return Container(
              alignment: Alignment.center,
              child: Text(
                format.format(getDate(index)).toString(),
              ),
            );
          },
        )
        // CustomScrollView(
        //   slivers: <Widget>[
        //     SliverAppBar(
        //       pinned: true,
        //       expandedHeight: 150.0,
        //       flexibleSpace: FlexibleSpaceBar(
        //         title: Text('${format.format(DateTime.now())}'),
        //       ),
        //     ),
        //     // Container(
        //     //   alignment: Alignment.center,
        //     //   width: MediaQuery.of(context).size.width,
        //     //   height: 60,
        //     //   decoration: BoxDecoration(
        //     //     color: Colors.lightBlue,
        //     //   ),
        //     //   child: Text('${format.format(DateTime.now())}',
        //     //       textDirection: TextDirection.ltr,
        //     //       style: TextStyle(
        //     //         color: Colors.black87,
        //     //         fontSize: 20,
        //     //         fontWeight: FontWeight.bold,
        //     //       )),
        //     // ),
        //     SliverFixedExtentList(
        //       itemExtent: 50.0,
        //       delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //           return Container(
        //             alignment: Alignment.center,
        //             color: Colors.lightBlue[100 * (index % 9)],
        //             child: Text('list item $index'),
        //           );
        //         },
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
