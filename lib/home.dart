import 'package:flutter/material.dart';
import 'package:flutter_liquid_glass/glass_approaches/custom_shaders.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white10, Colors.white10]),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildTestContent(),
              CustomShadersWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestContent() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        final colors = [
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.orange,
          Colors.purple,
          Colors.teal,
          Colors.pink,
          Colors.indigo,
        ];

        final color = colors[index % colors.length];

        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: color.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.shade300),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Item ${index + 1}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color.shade800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'This is test content with ${color.toString().split('.').last} theme',
                      style: TextStyle(fontSize: 14, color: color.shade600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: color, size: 16),
                        Icon(Icons.star, color: color, size: 16),
                        Icon(Icons.star, color: color, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          'Rating: ${(index % 5) + 1}/5',
                          style: TextStyle(fontSize: 12, color: color.shade500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class LightSourceScaffold extends StatelessWidget {
//    LightSourceScaffold({super.key});
//   final lightSource = LightSource(
//     color: Colors.white,
//     angle: 0,
//     position: Offset(0, 0),
//     intensity: 1,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [lightSource.color, Colors.white]),
//         ),
//         child: Center(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('BaseLayer!'),
//                   SizedBox(height: 10),
//                   Text('BaseLayer!'),
//                 ],
//               ),
//               CustomShadersWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }