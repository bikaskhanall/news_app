import 'package:flutter/material.dart';
import 'package:news_app/model/News_model.dart';
import 'package:news_app/screens/api.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  static const routeName = '/SecondPage';

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // NewsModel? model;
  final Api _api = Api();

  bool isLoading = false;
  void getData() async {
    // setState(() {
    //   isLoading = true;
    // });
    // model = await _api.fetchNews();
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Api Fetch"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: _api.fetchNews(),
              builder:
                  (BuildContext context, AsyncSnapshot<NewsModel?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 666,
                    child: ListView.builder(
                        itemCount: snapshot.data?.articles?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('third_page', arguments: {
                                    'title':
                                        snapshot.data?.articles?[index].title,
                                    'desc': snapshot
                                        .data?.articles?[index].description,
                                    'image': snapshot
                                        .data?.articles?[index].urlToImage
                                  });
                                },
                                child: Image.network(snapshot
                                        .data?.articles?[index].urlToImage ??
                                    'N/A'),
                              ),
                              Text(
                                snapshot.data?.articles?[index].author ?? "N/A",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot.data?.articles?[index].description ??
                                      "N/A",
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          );
                        }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
