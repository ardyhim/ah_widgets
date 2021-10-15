import 'package:ah_widgets/ah_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AHHeaderOne(
              description:
                  "This is a great recipe that I found in my Grandma's recipe book. Judging from the weathered look of this recipe card, this was a family favorite.",
              height: 250,
              imgBackground: 'https://source.unsplash.com/350x180/?food',
              imgThumbnail: 'https://source.unsplash.com/90x90/?avatar',
              name: 'Jacob Specter',
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext _, int i) {
                  return AHCardOne(
                    width: 400,
                    height: 150,
                    onTap: () {},
                    img: 'https://source.unsplash.com/150x150/?food,$i',
                    title: 'Made from Scratch Blueberry Flapjacks $i',
                    subtitle1: "37 - 48 mi",
                    subtitle2: "129 view",
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext _, int i) {
                  return AHCardThree(
                    height: 180,
                    width: 180,
                    img: 'https://source.unsplash.com/350x180/?diamond,$i',
                    text: "Diamonds",
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AHCardTwo(
              img: "https://source.unsplash.com/350x180/?food",
              height: 250,
              width: size.width,
              subtitle1: "10",
              subtitle2: "VOTE",
              color: Colors.red,
              title: "Made from Scratch Blueberry Flapjacks",
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: AHCardFour(
              showAuthor: true,
              showBookmark: true,
              shadow: true,
              height: 250,
              width: size.width,
              img: 'https://source.unsplash.com/180x250/?food',
              imgAuthor: 'https://source.unsplash.com/80x80/?blue',
              onTap: () {
                print("onTap");
              },
              onBookmark: () {
                print("onBookmark");
              },
              author: 'Ashton Thomas',
              title: "Good Old Fashioned Pancakes",
              description:
                  "This is a great recipe that I found in my Grandma's recipe book. Judging from the weathered look of this recipe card, this was a family favorite.",
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int i) {
                  return AHCardFive(
                    img: 'https://source.unsplash.com/150x150/?food,$i',
                    title: 'Cherry',
                    onTap: () => print("onTap AHCardFive $i"),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int i) {
                  return AHCardSix(
                    img: 'https://source.unsplash.com/150x150/?food,$i',
                    title: 'Cherry',
                    color: Colors.red,
                    textColor: Colors.white,
                    // showVote: false,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AHCardSeven(
              imgBackground: 'https://source.unsplash.com/250x250/?food',
              imgThumbnail: 'https://source.unsplash.com/80x80/?avatar',
              title: 'Entire House',
              subtitle1: "Available (200)",
              subtitle2: "Sleeps 2",
              subtitle3: "\$40/night",
              subtitle4: "Free Cancellations",
              height: 230,
              width: size.width,
            ),
          ),
        ],
      ),
    );
  }
}
