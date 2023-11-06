import 'package:audio_books/views/explore/widgets/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/app_color.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

List explore = [
  {'icon': Icons.trending_up_rounded, 'explore': 'Trending'},
  {'icon': Iconsax.heart, 'explore': 'Romance'},
  {'icon': Icons.child_care, 'explore': 'Children'},
  {'icon': Icons.trending_down, 'explore': 'Ancient'},
  {'icon': Icons.trending_down, 'explore': 'Hymns'},
];

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text('Explore Market'),
          actions: const [
            Icon(Iconsax.notification),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Icon(Iconsax.search_favorite),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TabBar(
                    controller: tabController,
                    tabs: explore
                        .map(
                          (e) => Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: AppColor.buttonColor)),
                            child: Text(e['explore']),
                          ),
                        )
                        .toList()),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      kToolbarHeight -
                      kBottomNavigationBarHeight,
                  child: TabBarView(controller: tabController, children: const [
                    ExploreCard(),
                    ExploreCard(),
                    ExploreCard(),
                    ExploreCard(),
                    ExploreCard(),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}

// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: explore
//         .map((e) => GestureDetector(
//               onTap: () {
//                 print(e['explore']);
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(right: 10),
//                 padding: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                         color: AppColor.buttonColor)),
//                 child: Row(
//                   children: [
//                     Icon(e['icon']),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(e['explore'])
//                   ],
//                 ),
//               ),
//             ))
//         .toList(),
//   ),
// ),


// TabBar(
                // controller: tabController,
                // tabs: [
                //   Tab(
                //     child: Container(
                //       margin: const EdgeInsets.only(right: 10),
                //       padding: const EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(color: AppColor.buttonColor)),
                //       child: const Text('Trending'),
                //     ),
                //   ),
                //   Tab(
                //     child: Container(
                //       margin: const EdgeInsets.only(right: 10),
                //       padding: const EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(color: AppColor.buttonColor)),
                //       child: const Text('Romance'),
                //     ),
                //   ),
                // ]
                // ),
