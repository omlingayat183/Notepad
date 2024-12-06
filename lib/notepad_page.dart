import 'package:flutter/material.dart';
import 'package:file_saver/file_saver.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class NotepadPage extends StatefulWidget{
  const NotepadPage({super.key});

  @override
  _NotepadPageState createState() => _NotepadPageState();
}

class _NotepadPageState extends State<NotepadPage>{
  final TextEditingController _controller = TextEditingController();

  Future<void> _saveFile(String fileName)async{
    final directory =  await getExternalStorageDirectory();
    final path = '${directory!.path}/Download/$fileName.txt';
    final file = File(path);
    await file.writeAsString(_controller.text);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File Save TO $path')),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                maxLines: 15,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write Your Notes Here....'
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String fileName = 'my_note';
                  _saveFile(fileName);
              },
                child: Text('Save Note'),
              ),
            ],
          ),
      ),
    );
  }
}