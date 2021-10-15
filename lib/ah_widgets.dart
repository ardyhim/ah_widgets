library ah_widgets;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AHHeaderOne extends StatelessWidget {
  AHHeaderOne({
    required this.height,
    this.color = Colors.orange,
    this.textColor = Colors.white70,
    required this.imgBackground,
    required this.imgThumbnail,
    required this.name,
    required this.description,
    this.onBack,
    this.enableBack = true,
  }) : assert(height >= 200);
  final double height;
  final Color color;
  final Color textColor;
  final String imgBackground;
  final String imgThumbnail;
  final String name;
  final String description;
  final VoidCallback? onBack;
  final bool enableBack;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(imgBackground,
                    cacheKey: imgBackground),
              ),
            ),
          ),
          ClipRRect(
            child: Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.grey.withOpacity(0.1),
                    Colors.black26.withOpacity(0.1),
                    Color.fromRGBO(14, 14, 14, 1).withOpacity(0.5),
                    Color.fromRGBO(14, 14, 14, 1).withOpacity(0.7),
                    Color.fromRGBO(14, 14, 14, 1).withOpacity(0.9),
                    Color.fromRGBO(14, 14, 14, 1).withOpacity(1),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: kToolbarHeight,
            child: Row(
              children: [
                if (enableBack)
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: onBack,
                      child: Icon(
                        Icons.arrow_back,
                        color: color,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: 90,
              height: 90,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border: Border.all(color: color, width: 2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    imgThumbnail,
                    cacheKey: imgThumbnail,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 120,
            child: Container(
              width: width - 130,
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: textColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AHCardOne extends StatelessWidget {
  AHCardOne({
    Key? key,
    required this.width,
    required this.height,
    this.onTap,
    required this.img,
    required this.title,
    this.color = Colors.orange,
    this.subtitle1 = "",
    this.subtitle2 = "",
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback? onTap;
  final String img;
  final Color color;
  final String title;
  final String subtitle1;
  final String subtitle2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height - 20,
        width: width,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(img, cacheKey: title),
          ),
        ),
        child: Container(
          height: height - 20,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: FractionalOffset.topRight,
              end: FractionalOffset(0.1, 0),
              colors: [
                Colors.grey.withOpacity(0.0),
                Colors.black38,
                Colors.black45,
              ],
              stops: [0.2, 0.7, 0.8],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                width: width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.grey.shade100,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
                child: Text(
                  subtitle1,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.grey.shade100,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
                child: Text(
                  subtitle2,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.grey.shade100,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AHCardTwo extends StatelessWidget {
  AHCardTwo({
    Key? key,
    required this.height,
    required this.width,
    required this.img,
    required this.title,
    this.onTap,
    this.color = Colors.orange,
    this.textColor = Colors.white,
    this.subtitle1 = "",
    this.subtitle2 = "",
  }) : super(key: key);

  final double width;
  final double height;
  final String img;
  final Color color;
  final Color textColor;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: img,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            backgroundColor: color,
            color: Colors.grey,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  width: width - 100,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 0),
                              blurRadius: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        subtitle1,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 30,
                              color: textColor,
                            ),
                      ),
                      Text(
                        subtitle2,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 12,
                              color: textColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AHCardThree extends StatelessWidget {
  AHCardThree({
    Key? key,
    required this.height,
    required this.width,
    required this.img,
    required this.text,
    this.onTap,
    this.color = Colors.orange,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String img;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: img,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                backgroundColor: color,
                color: Colors.grey,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: 2.5),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: onTap,
                    child: Center(
                      child: Text(
                        text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: textColor,
                          shadows: [
                            Shadow(
                              color: Colors.black45,
                              offset: Offset(1, 0),
                              blurRadius: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AHCardFour extends StatelessWidget {
  AHCardFour({
    Key? key,
    required this.height,
    required this.width,
    required this.img,
    this.imgAuthor = "https://source.unsplash.com/80x80/?placeholder",
    required this.author,
    required this.title,
    required this.description,
    this.onTap,
    this.onBookmark,
    this.color = Colors.orange,
    this.subtitle1 = "",
    this.subtitle2 = "",
    this.showAuthor = false,
    this.showBookmark = false,
    this.shadow = false,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final String img;
  final String imgAuthor;
  final String author;
  final String title;
  final String description;
  final String subtitle1;
  final String subtitle2;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;
  final bool showAuthor;
  final bool showBookmark;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          if (shadow)
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: width / 100 * 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(img, cacheKey: img),
              ),
            ),
          ),
          Positioned(
            left: (width / 100 * 35) + 20,
            child: Container(
              width: (width / 100 * 65) - 85,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (showAuthor)
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                imgAuthor,
                                cacheKey: imgAuthor,
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            right: 10,
                            left: showAuthor ? 10 : 0,
                          ),
                          child: Text(
                            author,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                      if (showBookmark)
                        IconButton(
                          icon: Icon(Icons.bookmark_border_outlined),
                          onPressed: onBookmark,
                        ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: (width / 100 * 35) + 20,
            bottom: 0,
            child: Container(
              width: (width / 100 * 65) - 85,
              height: 50,
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  Text(
                    subtitle1,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    subtitle2,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AHCardFive extends StatelessWidget {
  AHCardFive({
    Key? key,
    required this.title,
    required this.img,
    this.width = 100,
    this.height = 140,
    this.color = Colors.orange,
    this.textColor = Colors.black,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String img;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    img,
                    cacheKey: img,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AHCardSix extends StatelessWidget {
  AHCardSix({
    Key? key,
    required this.title,
    required this.img,
    this.vote = "5.0",
    this.width = 150,
    this.height = 190,
    this.color = Colors.orange,
    this.textColor = Colors.white,
    this.showVote = true,
  }) : super(key: key);
  final String img;
  final String title;
  final String vote;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final bool showVote;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            img,
            cacheKey: img,
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          if (showVote)
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  vote,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: textColor,
                      ),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width - 10,
              height: 60,
              child: Center(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        // shadows: [
                        //   Shadow(
                        //     blurRadius: 5.0,
                        //     color: Colors.black,
                        //     offset: Offset(3.0, 3.0),
                        //   ),
                        // ],
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AHCardSeven extends StatelessWidget {
  AHCardSeven({
    Key? key,
    required this.imgBackground,
    required this.imgThumbnail,
    required this.title,
    required this.height,
    required this.width,
    this.subtitle1 = " ",
    this.subtitle2 = " ",
    this.subtitle3 = " ",
    this.subtitle4 = " ",
    this.textButton = "4.5",
  })  : assert(height >= 230),
        super(key: key);

  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String subtitle4;
  final String textButton;
  final String imgBackground;
  final String imgThumbnail;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            imgBackground,
            cacheKey: imgBackground,
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white,
                      letterSpacing: 0.25,
                    ),
                  ),
                  Text(
                    subtitle1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white60,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    subtitle2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white70,
                      letterSpacing: 0.4,
                    ),
                  ),
                  Text(
                    subtitle3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white60,
                      letterSpacing: 0.4,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, right: 10, left: 10),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  // TextSpan(
                                  //   text: "★",
                                  //   style: TextStyle(
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  TextSpan(
                                    text: textButton,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(
                              5.0,
                            ),
                            child: Text(
                              subtitle4,
                              style: TextStyle(
                                // fontWeight:
                                //     FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.white60,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      imgThumbnail,
                      cacheKey: imgThumbnail,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
