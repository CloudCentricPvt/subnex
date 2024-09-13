import 'package:flutter/material.dart';

class ZomatoLikeScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar to create the floating app bar
          const SliverAppBar(
            floating: true,
            pinned: false,
            expandedHeight: 60.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery in',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '8 minutes',
                      style: TextStyle(
                          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'HOME - Keshav Arya, H-146/147 Sector',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // SliverPersistentHeader for the search bar
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchBarDelegate(),
          ),

          // SliverList for the content below the search bar
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        //margin: EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        alignment: Alignment.centerLeft,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search for products, brands and more',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 140.0;

  @override
  double get minExtent => 140.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
