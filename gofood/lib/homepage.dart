import 'package:flutter/material.dart';
import 'package:gofood/model.dart';

class GoFood extends StatefulWidget {
  @override
  _GoFoodState createState() => _GoFoodState();
}

class _GoFoodState extends State<GoFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          title: Text(
            "GoFood",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(
            Icons.restaurant,
          ),
          backgroundColor: Colors.greenAccent),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          // new Card(
          //   child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 8),
          //       child: new Column(
          //         children: <Widget>[_voucher(), _buildGoFoodFeatured()],
          //       )),
          // )
          new Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  _voucher(),
                  _buildGoFoodFeatured(),
                ],
              )),

          new Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  _buildPromo(),
                ],
              )),
          new Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  _buildlayanan(),
                ],
              )),
        ],
      ),
    );
  }

  Widget _voucher() {
    return new Container(
      height: 50.0,
      decoration: new BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
      )),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(12.0),
            decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(3.0),
                    topRight: new Radius.circular(3.0))),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  "Ada 25 Voucher Nganggur",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: "NeoSansBold"),
                ),
                new Text(
                  "Lihat",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: "NeoSansBold"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGoFoodFeatured() {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new SizedBox(
            height: 210.0,
            child: FutureBuilder<List>(
                future: fetchFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(top: 12.0),
                      physics: new ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _rowGoFoodFeatured(snapshot.data[index]);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: const CircularProgressIndicator()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _rowGoFoodFeatured(Food food) {
    return new Container(
      margin: EdgeInsets.only(right: 16.0),
      child: new Column(
        children: <Widget>[
          new ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: new Image.asset(
              food.image,
              width: 300.0,
              height: 170.0,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            food.title,
          ),
        ],
      ),
    );
  }

  Widget _buildPromo() {
    return new Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text(
            "Promo Pakai GoPay",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new Text(
            "Pilih menu favoritmu",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new SizedBox(
            height: 200.0,
            child: FutureBuilder<List>(
                future: fetchPromo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(top: 12.0),
                      physics: new ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _rowPromo(snapshot.data[index]);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: const CircularProgressIndicator()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _rowPromo(Promo promo) {
    return new Container(
      margin: EdgeInsets.only(right: 20.0),
      child: new Column(
        children: <Widget>[
          new ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: new Image.asset(
              promo.image,
              width: 150.0,
              height: 150.0,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            promo.title,
          ),
        ],
      ),
    );
  }

  Future<List<Food>> fetchFood() async {
    List<Food> _goFoodFeaturedList = [];
    _goFoodFeaturedList.add(
        new Food(title: "enak", image: "assets/images/gofood/banner_1.jpg"));
    _goFoodFeaturedList.add(new Food(
        title: "enak banget", image: "assets/images/gofood/banner_2.jpg"));
    _goFoodFeaturedList.add(
        new Food(title: "favorit", image: "assets/images/gofood/banner_3.jpg"));
    _goFoodFeaturedList.add(new Food(
        title: "best seller", image: "assets/images/gofood/banner_4.jpg"));
    _goFoodFeaturedList.add(
        new Food(title: "standar", image: "assets/images/gofood/banner_5.jpg"));

    return new Future.delayed(new Duration(seconds: 1), () {
      return _goFoodFeaturedList;
    });
  }

  Future<List<Promo>> fetchPromo() async {
    List<Promo> _promoFeaturedList = [];
    _promoFeaturedList.add(
        new Promo(title: "enak", image: "assets/images/gofood/drink_1.jpg"));
    _promoFeaturedList.add(new Promo(
        title: "enak banget", image: "assets/images/gofood/drink_2.jpg"));
    _promoFeaturedList.add(
        new Promo(title: "favorit", image: "assets/images/gofood/food_1.jpg"));
    _promoFeaturedList.add(
        new Promo(title: "favorit", image: "assets/images/gofood/food_2.jpg"));
    _promoFeaturedList.add(
        new Promo(title: "favorit", image: "assets/images/gofood/food_3.jpg"));
    _promoFeaturedList.add(new Promo(
        title: "best seller", image: "assets/images/gofood/food_4.jpg"));
    _promoFeaturedList.add(
        new Promo(title: "standar", image: "assets/images/gofood/food_5.jpg"));

    return new Future.delayed(new Duration(seconds: 1), () {
      return _promoFeaturedList;
    });
  }

  Widget _buildlayanan() {
    return new SizedBox(
        width: double.infinity,
        height: 280.0,
        child: new Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 8,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowbuildlayanan(_layananFeaturedList[position]);
                })));
  }

  Widget _rowbuildlayanan(Layanan layanan) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // showModalBottomSheet<void>(
              //     context: context,
              //     builder: (context) {
              //       // return _buildMenuBottomSheet();
              //     });
            },
            child: new Container(
              decoration: new BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(10.0))),
              padding: EdgeInsets.all(12.0),
              child: new Image.asset(
                layanan.image,
                color: layanan.color,
                width: 40.0,
                height: 40.0,
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0),
          ),
          new Text(layanan.title, style: new TextStyle(fontSize: 10.0))
        ],
      ),
    );
  }

  List<Layanan> _layananFeaturedList = [];

  @override
  void initState() {
    super.initState();

    _layananFeaturedList.add(new Layanan(
        image: "assets/images/gofood/drink_2.jpg", title: "es buah"));
    _layananFeaturedList.add(new Layanan(
        image: "assets/images/gofood/drink_1.jpg", title: "new entry"));
    _layananFeaturedList.add(
        new Layanan(image: "assets/images/gofood/drink_2.jpg", title: "promo"));
    _layananFeaturedList.add(new Layanan(
        image: "assets/images/gofood/drink_1.jpg", title: "terdekat"));
    _layananFeaturedList.add(new Layanan(
        image: "assets/images/gofood/drink_2.jpg", title: "best seller"));
    _layananFeaturedList.add(new Layanan(
        image: "assets/images/gofood/drink_1.jpg", title: "menu sehat"));
    _layananFeaturedList.add(new Layanan(
        image: "assets/images/gofood/drink_2.jpg", title: "favorit"));
    _layananFeaturedList.add(new Layanan(
        image: "assets/images/gofood/drink_1.jpg", title: "kebutuhan harian"));
  }
}
