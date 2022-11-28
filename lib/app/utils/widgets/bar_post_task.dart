
import 'package:flutter/material.dart';


class BarPost extends StatelessWidget {
  const BarPost({Key? key}) : super(key: key);
  final decoration = const BoxDecoration(
      color: Color.fromARGB(255, 242, 241, 241),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.person_add,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Miembros",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.label,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Etiquetas",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.check,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Check List",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.today,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Fechas",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.attach_file,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Adjuntos",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.move_to_inbox,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Mover",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.copy,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Copiar",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.create,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: Text(
                        "Crear plantilla",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.file_copy,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Archivar",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                decoration: decoration,
                width: 200,
                height: 50,
                child: Row(
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Compartir",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
