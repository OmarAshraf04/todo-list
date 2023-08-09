import 'package:flutter/material.dart';
import '../../data/models/todo.dart';

class Contents extends StatelessWidget {
  final Todos todo;
  const Contents({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(15),
          color: Colors.blue,
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
             const SizedBox(
               height: 46,
             ),

            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 90,
                child: Text(
                  todo.todo,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Completed: ',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(
                  width: 8,
                ),

                Text(
                  todo.completed.toString(),
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ],
        ),
        ),
        Positioned(
          top: 14,
          right: 15,
          child: Container(
            height: 40,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Text(
                todo.userId.toString(),
                style: const TextStyle(
                  fontSize: 16.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]
    );
  }
}
