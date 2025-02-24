import 'package:flutter/material.dart';
import '../widgets/recent_news_widget.dart';
import '../widgets/a_lot_of_reactions_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: TextField(
              decoration:
                  InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(18),
                    prefixIcon: Icon(
                      Icons.search,
                      weight: 800,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      weight: 800,
                    ),
                    hintText: "Search",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 10.0,
                        color: Colors.grey, // Ensure this color is visible
                    ),
                    ),
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left label
                Text(
                  "Filters",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),

                // Right label with icon
                Row(
                  children: [
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    SizedBox(width: 4), // Spacing between text and icon
                    Icon(Icons.filter_list_rounded, size: 20),
                  ],
                ),
              ],
            ),
          ),

          // Recent News Section
          RecentNewsWidget(),
          ALotOfReactionsWidget(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title text on the left with padding
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 0), // Margin on the left side of the title
            child: Text(
              'Hello, Lisa',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          // Profile picture on the right with padding
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 0), // Margin on the right side of the profile picture
            child: CircleAvatar(
              radius: 25, // size of the profile picture
              backgroundImage: NetworkImage("https://s3-alpha-sig.figma.com/img/4a2f/b2d7/947b5d93c4e6879e187bf9603e4a040e?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ef1iCNGkqtPk1F9Ysvt7QbC6eolyKmdVHRwOY82szkO1aDIcoHKMFuzwLeW2M17yxQ5gijLOO6TB9z4~3loA8h9JIPyZqGjSYrG~Lou6uQx3lBUHTPzuTbIHzDYhGZruwU9HGV0MPZ9Sv2aCN0x1qEdHFGOQ~xc5837V0tpaxdgt5e1WFB9eMmCtcGzIkqeTWJntr3C9lku0o7JAFNnZAd0btDtKmCFaHMB3pojmPKQLFzcKn2cyDgy2YBtJ1t9AxrBan2C7CU~QateoMqJvefF0zUgVzoaoVftFiGdb75keBLjfefvzkSeahIFZVEcp5YR68YJYMSDYLj8HA9Q-VQ__"), // Random image
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
