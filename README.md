# ah_widgets

Kumpulan widgets buat kamu

## Cara menggunakan

### Install package

```
flutter pub get ah_widgets
```

### Import package

```dart
import 'package:ah_widgets/ah_widgets.dart';
```

### AHHeaderOne

```dart
AHHeaderOne(
  description:
      "This is a great recipe that I found in my Grandma's recipe book. Judging from the weathered look of this recipe card, this was a family favorite.",
  height: 250,
  imgBackground: 'https://source.unsplash.com/350x180/?food',
  imgThumbnail: 'https://source.unsplash.com/90x90/?avatar',
  name: 'Jacob Specter',
)
```

### AHCardOne

```dart
Container(
  height: 220,
  width: 500,
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
)
```

### AHCardTwo

```dart
AHCardTwo(
  img: "https://source.unsplash.com/350x180/?food",
  height: 250,
  width: 500,
  subtitle1: "10",
  subtitle2: "VOTE",
  color: Colors.red,
  title: "Made from Scratch Blueberry Flapjacks",
  onTap: () {},
)
```

### AHCardThree

```dart
Container(
  height: 220,
  width: 500,
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
)
```

### AHCardFour

```dart
AHCardFour(
  showAuthor: true,
  showBookmark: true,
  shadow: true,
  height: 250,
  width:500,
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
)
```

### AHCardFive

```dart
Container(
  width: 500,
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
)
```

### AHCardSix

```dart
Container(
  width: 500,
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
)
```

### AHCardSeven

```dart
AHCardSeven(
  imgBackground: 'https://source.unsplash.com/250x250/?food',
  imgThumbnail: 'https://source.unsplash.com/80x80/?avatar',
  title: 'Entire House',
  subtitle1: "Available (200)",
  subtitle2: "Sleeps 2",
  subtitle3: "\$40/night",
  subtitle4: "Free Cancellations",
  height: 230,
  width: size.width,
)
```
