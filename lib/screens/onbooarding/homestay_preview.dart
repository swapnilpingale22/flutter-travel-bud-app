import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bud/common_widgets/custom_cliprrect.dart';
import 'package:travel_bud/provider/homestay_provider.dart';
import 'package:travel_bud/screens/onbooarding/preview_contacts_tab.dart';
import 'package:travel_bud/screens/onbooarding/preview_details_tab.dart';

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
                  'Preview',
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      homestay.coverPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 90,
                    child: SizedBox(
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomClipRRect(photoUrl: homestay.photos[1]),
                          CustomClipRRect(photoUrl: homestay.photos[2]),
                          CustomClipRRect(photoUrl: homestay.photos[3]),
                          CustomClipRRect(photoUrl: homestay.photos[4]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    SizedBox(
                      height: 950,
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          PreviewDetailsTabContent(),
                          PreviewContactsTabContent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
