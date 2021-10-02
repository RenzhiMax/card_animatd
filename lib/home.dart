import 'package:flutter/material.dart';

import 'Movie.dart';
import 'SlidingCard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TabRow(), Sliding(), Recommend(), ListItme()],
    );
  }
}

class TabRow extends StatelessWidget {
  const TabRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Text(
            "正在热播",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
          ),
          Expanded(child: Container()),
          ClipOval(
            child: Image.network(
              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.touxiangzhan.com%2Fupload%2Fimage%2F2a303433290n268091774t15.jpg&refer=http%3A%2F%2Fimg.touxiangzhan.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1635749191&t=d58d42ac4d1c76868868a6fff32bef6d',
              width: 50,
              height: 50,
            ),
          )
        ],
      ),
    );
  }
}

//列表区域
class Sliding extends StatefulWidget {
  @override
  _SlidingState createState() => _SlidingState();
}

class _SlidingState extends State<Sliding> {
  List<Movie> movies = [
    Movie(
      name: '怒火・重案',
      intro: '重案组布网围剿国际毒枭，突然杀出一组蒙面悍匪 '
          '“黑吃黑”，更冷血屠杀众警察。重案组督察张崇邦（甄子丹 饰）亲睹战友被杀，深入追查发现，悍匪首领竟是昔日战友邱刚敖（谢霆锋 饰）。',
      poster: 'assets/poster_nuhuo.webp',
      date: '2021-07-30',
      price: '19.99',
    ),
    Movie(
      name: '沙丘・Dune',
      intro: '电影《沙丘》为观众呈现了一段神秘而感人至深的英雄之旅。天赋异禀的少年保罗・厄崔迪被命运指引，为了保卫自己的家族和人民，决心前往'
          '浩瀚宇宙间最危险的星球，开启一场惊心动魄的冒险。与此同时，各路势力为了抢夺这颗星球上一种能够释放人类最大潜力的珍贵资源而纷纷加入战场。最终，唯有那些能够战胜内心恐惧的人才能生存下去。',
      poster: 'assets/poster_dune.jpg',
      date: '2021-09-03',
      price: '29.99',
    ),
    Movie(
      name: '速度与激情 9',
      intro:
          '“唐老大” 多姆・托莱多（范・迪塞尔 饰）与莱蒂（米歇尔・罗德里格兹 饰）和他的儿子小布莱恩，过上了远离纷扰的平静生活。然而他们也知道，安宁之下总潜藏着危机。这一次，为了保护他所爱的人，唐老大不得不直面过去。他和伙伴们面临的是一场足以引起世界动荡的阴谋，以及一个前所未遇的一流杀手和高能车手。而这个名叫雅各布（约翰・塞纳 饰）的人，恰巧是多姆遗落在外的亲弟弟。',
      poster: 'assets/poster_speed9.jpeg',
      date: '2021-05-21',
      price: '9.99',
    ),
  ];

  PageController? _pageController;
  double pageOffset = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.86);
    _pageController!.addListener(() {
      setState(() => pageOffset = _pageController!.page!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Center(
        child: PageView(
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          children: List.generate(movies.length, (index) {
            return SlidingCard(
              movie: movies[index],
              offset: pageOffset,
            );
          }),
        ),
      ),
    );
  }
}

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 18, right: 18),
        child: Row(
          children: [
            Text(
              '推荐电影',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Expanded(child: Container()),
            Text(
              '显示全部',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ));
  }
}

class ListItme extends StatelessWidget {
  final List<String> data = [
    'assets/poster_dune.jpg',
    'assets/poster_nuhuo.webp',
    'assets/poster_speed9.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(left: 28),
              width: 250,
              height: 200,
              child: Card(
                child: Image.asset(
                  data[0],
                  fit: BoxFit.cover,
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 12,
                margin: EdgeInsets.only(bottom: 26, right: 10, top: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Container(
              width: 250,
              height: 200,
              child: Card(
                child: Image.asset(
                  data[2],
                  fit: BoxFit.cover,
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 12,
                margin: EdgeInsets.only(bottom: 26, right: 10, top: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Container(
              width: 250,
              height: 200,
              child: Card(
                child: Image.asset(
                  data[1],
                  fit: BoxFit.cover,
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 12,
                margin: EdgeInsets.only(bottom: 26, right: 10, top: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        ));
  }
}
