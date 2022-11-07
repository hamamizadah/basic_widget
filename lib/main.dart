import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VALORANT AGENTS COLLECTION',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Valorant Agents Collection'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (BuildContext context, int index) {
              final _item = _articles[index];
              return Container(
                height: 136,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _item.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text("${_item.author} · ${_item.postedOn}",
                            style: Theme.of(context).textTheme.caption),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icons.bookmark_border_rounded,
                            Icons.share,
                            Icons.more_vert
                          ].map((e) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(e, size: 16),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(_item.imageUrl),
                            ))),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final String postedOn;

  Article(
      {required this.title,
      required this.imageUrl,
      required this.author,
      required this.postedOn});
}

final List<Article> _articles = [
  Article(
    title: "5.10 Navigation Bar Changes | #VALORANT",
    author: "@ValorLeaks",
    imageUrl:
        "https://pbs.twimg.com/media/FgwZLQZXoAEuq_t?format=jpg&name=large",
    postedOn: "Yesterday",
  ),
  Article(
      title: "SOULSTRIFE GIVEAWAY ",
      imageUrl:
          "https://pbs.twimg.com/media/FgkQUodWQAIs7KX?format=jpg&name=small",
      author: "@ValorLeaks",
      postedOn: "4 hours ago"),
  Article(
    title: "Soulstrife Card | #VALORANT",
    author: "@ValorLeaks",
    imageUrl:
        "https://pbs.twimg.com/media/FgfXj2BXEAMelAM?format=png&name=small",
    postedOn: "2 days ago",
  ),
  Article(
    title:
        "Check out all Ion 2.0 Weapon Skins, Karambit, and all Variants In-Game now in our latest video. Go Check it out: https://youtu.be/XUi_TguX0WA | #VALORANT",
    author: "@ValorLeaks",
    imageUrl:
        "https://pbs.twimg.com/media/FfXDNrnXoAAwpH4?format=jpg&name=small",
    postedOn: "22 hours ago",
  ),
  Article(
    title: "Ion Bundle | #VALORANT ",
    author: "@ValorLeaks",
    imageUrl:
        "https://pbs.twimg.com/media/FfW19exXwAALUdb?format=jpg&name=small",
    postedOn: "2 hours ago",
  ),
  Article(
    title: "Ion 2.0 Weapon Variants | #VALORANT",
    author: "@ValorLeaks",
    imageUrl:
        "https://pbs.twimg.com/media/FfWunPNX0AAhPLT?format=jpg&name=small",
    postedOn: "10 days ago",
  ),
  Article(
    title: "Valorant 5.08 Patchnotes | #VALORANT",
    author: "@ValorLeaks",
    imageUrl:
        "https://pbs.twimg.com/media/FfWsGb6VQAA-Oy8?format=jpg&name=small",
    postedOn: "10 hours ago",
  ),
];
