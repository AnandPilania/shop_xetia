import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductReview extends StatelessWidget {
  const DetailProductReview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(color: context.theme.primaryColorDark, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Review", style: context.textTheme.headline3),
                  Text("See All Review >", style: context.textTheme.headline5)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: context.theme.primaryColor.withOpacity(0.25), borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Row(
                              children: [
                                Icon(Icons.star),
                                Text(
                                  "4.8",
                                  style: context.textTheme.headline5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("9 Reviews", style: context.textTheme.headline5.copyWith(color: context.theme.primaryColor)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((100)),
                        color: const Color(0xffffbcb3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular((100)),
                        child: Image.network(
                          "https://pbs.twimg.com/profile_images/765839667446939649/E3wjG-7g.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        for (bool isStarred in List.generate(5, (i) => i < 4 ? true : false))
                          Icon(Icons.star, color: isStarred == true ? context.theme.primaryColor : Colors.grey)
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "lorem ipsum lorem ipsumlorem ipsum lorem ipsum",
                style: context.textTheme.headline4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
