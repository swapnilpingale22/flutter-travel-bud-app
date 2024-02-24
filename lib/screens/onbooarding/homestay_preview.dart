import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/contacts_tab_2.dart';
import 'package:travel_bud/screens/onbooarding/details_tab_2.dart';

class HomestayPreviewScreen extends StatefulWidget {
  static const String routeName = '/homestay-preview';

  const HomestayPreviewScreen({Key? key}) : super(key: key);

  @override
  State<HomestayPreviewScreen> createState() => _HomestayPreviewScreenState();
}

class _HomestayPreviewScreenState extends State<HomestayPreviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homestay =
        Provider.of<HomestayProvider>(context, listen: false).homestay;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preview from Provider',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    homestay.photos[0],
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(height: 10),
            Text(
              homestay.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              '${homestay.address}, ${homestay.city}',
              style: const TextStyle(
                color: Colors.black38,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${homestay.startPrice} - \$${homestay.endPrice}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            DefaultTabController(
              length: 2,
              child: TabBar(
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                labelColor: Colors.blue,
                controller: _tabController,
                tabs: const [
                  Text('Details'),
                  Text('Contacts'),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 1000,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      DetailsTabContent2(),
                      ContactsTabContent2(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
