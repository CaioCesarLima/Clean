import 'package:clean_project/home/home.dart';
import 'package:flutter/material.dart';

class IntroApp extends StatefulWidget {
  @override
  _IntroAppState createState() => _IntroAppState();
}

class _IntroAppState extends State<IntroApp> {
  PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool showArrow = true;

  List<Widget> pages = [
    Page(
        "Insira os dados necessários que o Cleaning cuida do restante para você.",
        'Poupe tempo com os módulos de gerenciamento e relatórios.',
        'images/logoFerramenta.png'),
    Page(
        "Seu funcionário com as informações necessárias para o dia a dia.",
        'Módulo de acesso ao funcionário.',
        'images/logoPessoal.png'),
    Page(
        "Seu cliente com a agenda garantida.",
        'Módulo de consulta do cliente.',
        'images/logoCalendario.png'),
    Page(
        "Bem vindo ao Cleaning!",
        'Nós ajudamos você a gerenciar seu schedule tornando o acesso as informações eficiente, seja proprietária, funcionário ou cliente.',
        'images/logoBem-vindo.png'),
  ];

  void changeArrow(snap) {
    setState(() {
      showArrow = snap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }));
          },
          child: Container(
              padding: EdgeInsets.only(left: 20, top: 20), child: Text("SKIP")),
        ),
        elevation: 0,
        actions: <Widget>[
          showArrow == true
              ? GestureDetector(
                  onTap: () {
                    controller.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.bounceOut);
                  },
                  child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.keyboard_arrow_right)),
                )
              : Container(),
        ],
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
      ),
    );
  }
}

class Page extends StatelessWidget {
  String texto1;
  String texto2;
  String logo;
  Page(texto1, texto2, logo) {
    this.texto1 = texto1;
    this.texto2 = texto2;
    this.logo = logo;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                  width: 280,
                  height: 350,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          texto1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          texto2,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )),
            ),
            Positioned(
              top: 45,
              left: 80,
              child: Container(
                  width: 200,
                  height: 200,
                  child: logo != '' ? Image.asset(logo) : Container()),
            )
          ],
        ),
      ),
    );
  }
}
