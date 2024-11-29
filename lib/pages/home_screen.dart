import 'package:flutter/material.dart';
import 'package:tech_newz/backend/fetch_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List news = [];
  // late Future<List> news;

  @override
  void initState() {
    fetchNews();
    super.initState();
    // news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: FutureBuilder<List>(
              future: fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Text(snapshot.data![index]['title']),
                            Text(snapshot.data![index]['description']),
                            Image(image: NetworkImage(snapshot.data![index]['urlToImage']))
                          ],
                        )
                      );
                    },
                  );
                }
                return Center();
              },
            ),
          ))
        ],
      ),
    );
  }
}
