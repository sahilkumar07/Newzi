
import 'package:flutter/material.dart';
import 'package:technewz/backend/functions.dart';
import 'package:technewz/components/appbar.dart';
import 'package:technewz/components/searchbar.dart';
import 'package:technewz/utils/colors.dart';
import 'package:technewz/components/newsbox.dart';
import 'package:technewz/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List> news;
  String selectedCountry = 'us'; // Default country
  String selectedCategory = 'technology'; // Default category

  @override
  void initState() {
    super.initState();
    news = fetchNews(selectedCountry, selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: Appbar(
        onCategorySelected: (category) {
          setState(() {
            selectedCategory = category;
            news = fetchNews(selectedCountry, selectedCategory);
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Technology'),
              onTap: () {
                _selectCategory('technology');
              },
            ),
            ListTile(
              title: const Text('Business'),
              onTap: () {
                _selectCategory('business');
              },
            ),
            ListTile(
              title: const Text('Sports'),
              onTap: () {
                _selectCategory('sports');
              },
            ),
            ListTile(
              title: const Text('Entertainment'),
              onTap: () {
                _selectCategory('entertainment');
              },
            ),
            // Add more categories as needed
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  // Search bar implementation goes here
                  child: const SearchBars(),
                ),
              ),
              const SizedBox(width: 10),
              const Text('Select Country: '),
              DropdownButton<String>(
                value: selectedCountry,
                items:const [
                  DropdownMenuItem(value: 'us', child: Text('United States')),
                  DropdownMenuItem(value: 'ca', child: Text('Canada')),
                  DropdownMenuItem(value: 'in', child: Text('India')),
                  DropdownMenuItem(value: 'za', child: Text('South Africa')),
                  DropdownMenuItem(value: 'au', child: Text('Australia')),
                   DropdownMenuItem(value: 'gb', child: Text('United Kingdom')),
                    DropdownMenuItem(value: 'nz', child: Text('New Zealand')),
                    DropdownMenuItem(value: 'ie', child: Text('Ireland')),
                      DropdownMenuItem(value: 'jm', child: Text('Jamaica')),
                      DropdownMenuItem(value: 'sg', child: Text('Singapore')),
                      DropdownMenuItem(value: 'ng', child: Text('Nigeria')),
                  // Add more countries as needed
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                    news = fetchNews(selectedCountry, selectedCategory);
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] ?? Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description: snapshot.data![index]['description'].toString(),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      news = fetchNews(selectedCountry, selectedCategory);
    });
    Navigator.pop(context);
  }
}