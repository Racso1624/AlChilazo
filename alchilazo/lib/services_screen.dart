import 'package:alchilazo/mostrar_trabajador.dart';
import 'package:flutter/material.dart';
import 'contratar.dart';
import 'package:alchilazo/mongo.dart';

var trabajadores = [];

Future _getData() async {
  trabajadores = await MongoDatabase.getData_workers();
}


class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Servicios"),
        backgroundColor: Color.fromARGB(225, 255, 4, 4),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopBar(),
              const SearchInput(),
              const HeadlineRecommendation(),
              const PromoCard(),
              const Headline(),
              const CardListView(),
              GradientButtonFb4(
                  text: "Buscar",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Contratar())));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Encuentra el servicio\nque desees:",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
          )
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 25.0, right: 25.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ]),
        child: TextField(
          onChanged: (value) {
            //Do something wi
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Buscar',
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}

class HeadlineRecommendation extends StatelessWidget {
  const HeadlineRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Algunas Recomendaciones",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
                "https://cdn.create.vista.com/api/media/medium/310711716/stock-photo-middle-aged-constructor-holding-hammer?token="),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Servicios Disponibles",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Card(
                "Electricista",
                "https://www.lecciona.com/wp-content/uploads/2020/11/ELECTRICISTA.jpg",
                ""),
            Card(
                "Jardineria",
                "https://media.istockphoto.com/photos/garden-worker-trimming-plants-picture-id1166203849?k=20&m=1166203849&s=612x612&w=0&h=UVoI3c9o4DljCFxpRpJznJE5zONRgo9sxeyysO7xVZw=",
                ""),
            Card(
                "Plomeria",
                "https://www.albaniles.org/wp-content/uploads/2016/08/plomero1-1024x713.jpg",
                ""),
            Card(
                "Albañileria",
                "https://thumbs.dreamstime.com/b/alba%C3%B1iler%C3%ADa-118881926.jpg",
                ""),
            Card(
                "Carpinteria",
                "https://ace-australia.com/wp-content/uploads/2021/09/Carpentry-1500x1000.webp",
                ""),
            Card(
                "Cerrajeria",
                "https://www.cerrajeriaelhuron.com/uploads/PfYEdhSC/737x0_540x0/persona-instalando-chapa.jpg",
                ""),
            Card(
                "Computación",
                "https://sotein.com.co/wp-content/uploads/2019/04/Arreglo-de-computadoras-1.jpg",
                "Servicio"),
            Card(
                "Pintura",
                "https://www.reformas-baratas.es/wp-content/uploads/2018/04/pintar.jpg",
                "Servicio"),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;

  Card(this.text, this.imageUrl, this.subtitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 15),
      child: new InkWell(
        onTap: () {
          _getData();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ViewWorker(
                        trabajo: text,
                        trabajadores: trabajadores,
                      ))));
        },
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Column(
            children: [
              Image.network(imageUrl, height: 70, fit: BoxFit.cover),
              Spacer(),
              Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButtonFb4 extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const GradientButtonFb4(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  final double borderRadius = 25;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: const LinearGradient(
                colors: [Color(0xff53E88B), Color(0xff15BE77)])),
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                alignment: Alignment.center,
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                    right: 75, left: 75, top: 15, bottom: 15)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                )),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            )));
  }
}
