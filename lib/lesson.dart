import 'package:flutter/material.dart';

class Lesson extends StatelessWidget {
  const Lesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(""),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, size: 26, color: Colors.black54),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text("Search...",
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(title: "Style"),
                FilterButton(title: "Saved"),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.75,
              children: List.generate(6, (index) => LessonTile(index: index)),
            ),
          )
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String title;
  const FilterButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  final int index;
  const LessonTile({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Twerk",
      "Heels choreo with \nMarta",
      "Strip",
      "High heels",
      "Twerk with Aino",
      "Bachata",
    ];
    final List<String> durations = ["11 min", "5 min", "9 min", "7 min", "18 min", "3 min"];
    final List<String> labels = ["Twerk", "Heels", "Strip", "Heels", "Twerk", "Bachata"];
    final List<String> studios = ["Girlhood", "Studio 1", "Girlhood", "Girlhood", "The WDA Studio", "Lava"];

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage('assets/images/lesson${index + 1}.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Icon(Icons.favorite_border, color: Colors.white),
        ),
        Positioned(
          left: 12,
          bottom: 36,
          child: Text(
            titles[index],
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          left: 12,
          bottom: 18,
          child: Row(
            children: [
              _tag("Free", color: Colors.blue),
              const SizedBox(width: 6),
              _tag(durations[index]),
              const SizedBox(width: 6),
              _tag(labels[index]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tag(String label, {Color color = Colors.black54}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
