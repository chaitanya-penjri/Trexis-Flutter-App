import 'package:flutter/material.dart';

class ListGridTabsPage extends StatefulWidget {
  const ListGridTabsPage({Key? key}) : super(key: key);

  @override
  State<ListGridTabsPage> createState() => _ListGridTabsPageState();
}

class _ListGridTabsPageState extends State<ListGridTabsPage> {
  var bottomTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('List Grid Tabs'),
            bottom: TabBar(
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Grid'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('List'),
                )
              ],
              onTap: (index) {
                print(index);
              },
            ),
          ),
          body: TabBarView(
            children: [_contentGridView(), _contentListView()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                bottomTabIndex = index;
              });
            },
            currentIndex: bottomTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app),
                label: 'Exit',
              ),
            ],
          ),
        ));
  }

  Widget _contentListView() {
    return ListView.builder(
      itemCount: 44,
      itemBuilder: (context, index) => Card(
        color: Colors.lightGreen[100],
        child: ListTile(
          title: _getListTileTitle(index + 1),
        ),
      ),
    );
  }

  Widget _getListTileTitle(int index) {
    var text = "";

    switch (index % 10) {
      case 1:
        text = " st";
        break;
      case 2:
        text = " nd";
        break;
      case 3:
        text = " rd";
        break;
      default:
        text = " th";
    }
    if (index >= 11 && index <= 13) {
      text = " th";
    }

    return Text("${index}$text Item");
  }

  Widget _contentGridView() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 18,
      itemBuilder: (context, index) => Card(
          color: Colors.lightBlue[100],
          child: GridTile(child: Center(child: Text(index.toString())))),
    );
  }
}
