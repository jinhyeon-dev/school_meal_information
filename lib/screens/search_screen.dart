import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:school_meal_information/controller/school_controller.dart';
import 'package:school_meal_information/model/school_info.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<SchoolInfo> _data = [];

  String _name = '';

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        SchoolController controller = Get.find<SchoolController>();

        controller.index = controller.index + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) => _name = value,
              ),
            ),
            IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                _data.clear();

                Get.find<SchoolController>().index = 1;
                Get.find<SchoolController>().name = _name;
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () {
            SchoolController controller = Get.find<SchoolController>();
            return FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  _data.addAll(snapshot.data ?? []);

                  return ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(_data[index].name),
                      onTap: () => Get.back(result: _data[index]),
                    ),
                    itemCount: _data.length,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
              future: Get.find<SchoolController>()
                  .getSchools(controller.index, controller.name),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
