
import 'package:remotemusic/model.dart';

class Channel{
  String url;
  String title;
  String gerne;
  int rank;
  String imgurl;
  Channel({this.title,this.url,this.gerne,this.imgurl});

  factory Channel.fromJson(Map<String, dynamic> parsedJson){
      return Channel(title:parsedJson['title'].toString(), url:parsedJson['url'], gerne:parsedJson['type'].toString(),imgurl:parsedJson['imgurl'].toString());
  }
  static getCategories(List<Channel> list){
    return Set.from(list.map((ch)=>ch.gerne)).toList();
  }
}
List getChannels()  {
   return [Channel(
     title:"Desi Music Mix!",url:"http://158.69.161.125:8012/?type=http&nocache=57533",gerne:"",imgurl:"https://mytuner.global.ssl.fastly.net/media/tvos_radios/Typgmp8Z8D.png"),
     Channel(url:"http://5.196.56.208:8308/stream",
     title: "Hindi Music Radio - anytime, anywere",
     imgurl: "https://images-na.ssl-images-amazon.com/images/I/51WSc%2BN-5CL._SY355_.png"),
     Channel(title:"Mehfil Radio",
     url:"http://mehefil.no-ip.com/mehefil",
     imgurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMd4s3oWzzUvWBM_7L54w5_qduRsvThX3vChcnC3eGj1BoZc8Q&usqp=CAU"
     ),
    Channel(url:"http://176.31.107.8:8459/stream",
    title: "Radio Central",
    imgurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4X8tigdkbQtr7R7U2Vesifoo7_e3sGsk_wBV7GqEgBNZfZPA&s"),];
 }


Channel currentCh=getChannels()[0];
PlayerModel playerModel=PlayerModel();