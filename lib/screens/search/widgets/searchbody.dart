import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotstar/utils/colors.dart';
import 'package:hotstar/utils/styles.dart';

class SearchScreenBody extends StatefulWidget {
  const SearchScreenBody({super.key});

  @override
  State<SearchScreenBody> createState() => _SearchScreenBodyState();
}

class _SearchScreenBodyState extends State<SearchScreenBody> {
  List<String> categories = [
    "India",
    "Movies",
    "Shoes",
    "Action",
    "Comedy",
    "Crime",
    "Drama",
    "Romance",
    "Thriller",
    "Horror",
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "People Search For",
                style: MyTextStyles.headinglightStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.040,
            width: double.infinity,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Builder(builder: (context) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(color: lightwhite, width: 0.3),
                            color: current == index ? selectedColor : black,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (index == 0)
                              Flexible(
                                child: Icon(
                                  FontAwesomeIcons.arrowTrendUp,
                                  color: white,
                                  size: 10,
                                ),
                              ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              categories[index],
                              style: current == index
                                  ? MyTextStyles.catSelected
                                  : MyTextStyles.catDefault,
                            ),
                          ],
                        )),
                      );
                    }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
