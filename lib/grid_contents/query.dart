import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsskos_app/Authentication/controllers/QueryController.dart';

class Query extends StatelessWidget {
  final controller = Get.put(QueryController());
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 214, 84, 67),
          centerTitle: true,
          title: const Text('Query Box'),
        ),
        backgroundColor: const Color.fromARGB(248, 255, 255, 255),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Ask Away! Type your question in the box below and send it our way. We're here to help.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: controller.responseController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Response',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: controller.sendEmail,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      );
}
