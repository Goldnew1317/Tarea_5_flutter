import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brooklyn Nine-Nine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/characters': (context) => const CharactersPage(),
        '/moments': (context) => const MomentsPage(),
        '/about': (context) => const AboutPage(),
        '/myLife': (context) => const MyLifePage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brooklyn Nine-Nine'),
      ),
      body: Center(
        child: Image.asset(
          'assets/brooklyn99.gif',
          fit: BoxFit.cover,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              title: const Text('Personajes'),
              onTap: () {
                Navigator.pushNamed(context, '/characters');
              },
            ),
            ListTile(
              title: const Text('Momentos'),
              onTap: () {
                Navigator.pushNamed(context, '/moments');
              },
            ),
            ListTile(
              title: const Text('Acerca de'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('En mi vida'),
              onTap: () {
                Navigator.pushNamed(context, '/myLife');
              },
            ),
            ListTile(
              title: const Text('Contrátame'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
      ),
      body: ListView(
        children: const [
          CharacterCard(
            name: 'Jake Peralta',
            actor: 'Andy Samberg',
            imagePath: 'assets/jake_peralta.jpg',
          ),
          CharacterCard(
            name: 'Rosa Diaz',
            actor: 'Stephanie Beatriz',
            imagePath: 'assets/rosa_diaz.jpg',
          ),
          CharacterCard(
            name: 'Terry Jeffords',
            actor: 'Terry Crews',
            imagePath: 'assets/terry_jeffords.jpg',
          ),
        ],
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final String name;
  final String actor;
  final String imagePath;

  const CharacterCard({
    super.key,
    required this.name,
    required this.actor,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailPage(
              name: name,
              actor: actor,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterDetailPage extends StatelessWidget {
  final String name;
  final String actor;
  final String imagePath;

  const CharacterDetailPage({
    super.key,
    required this.name,
    required this.actor,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del personaje'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 300,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Interpretado por: $actor',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class MomentsPage extends StatelessWidget {
  const MomentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Momentos'),
      ),
      body: ListView(
        children: const [
          MomentCard(
            title: 'I want it that way',
            imagePath: 'assets/that_way.jpg',
            videoUrl: 'https://www.youtube.com/watch?v=ffyKY3Dj5ZE',
          ),
          MomentCard(
            title: 'La boda de Jake y Amy',
            imagePath: 'assets/jake_amy_wedding.jpg',
            videoUrl: 'https://www.youtube.com/watch?v=SGvI7_ecSZQ',
          ),
          MomentCard(
            title: 'Jake y Doug Judy Rap',
            imagePath: 'assets/Jake_Judy.jpg',
            videoUrl: 'https://www.youtube.com/watch?v=VIDEO_ID_3',
          ),
        ],
      ),
    );
  }
}

class MomentCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String videoUrl;

  const MomentCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MomentDetailPage(
              title: title,
              imagePath: imagePath,
              videoUrl: videoUrl,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
            ),
            ListTile(
              title: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}

class MomentDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String videoUrl;

  const MomentDetailPage({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del momento'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => VideoPlayerDialog(videoUrl: videoUrl),
              );
            },
            child: const Text('Reproducir video'),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerDialog extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerDialog({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerDialogState createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();

    // ..initialize().then((_) {
    //   setState(() {
    //     _controller.play();
    //   });
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.pause();
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/b99.png'),
            const Text(
              'Brooklyn Nine-Nine',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Sipnosis:",
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              """
              La serie gira en torno a Jake Peralta, un talentoso pero inmaduro detective
              del Departamento de Policias de Nueva York(DPNY) en la ficticia comisaría 99
              de Brooklyn, que a menudo entra en conflicto con su oficial al mando, el
              serio y severo capitán Raymond Holt.""",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cantidad de temporadas: 8',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Creador: Dan Goor',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class MyLifePage extends StatelessWidget {
  const MyLifePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('En mi vida'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Relevancia de esta Serie en mi vida:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              """
              Esta serie es bastante buena para mi, 
              ya que al ser de comedia, me alegra el dia, 
              me suele relajar y desestresar tomar un 
              momento para ver un episodio de esta serie""",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contrátame'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '¡Contáctame!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CircleAvatar(
              backgroundImage: AssetImage('assets/Foto_2x2.png'),
              radius: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Nombre: Newder Manuel Espinosa Davis',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Correo electrónico: Newdermed84@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Teléfono: 849-277-1317',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
