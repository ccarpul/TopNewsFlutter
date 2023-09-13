import 'package:top_news_flutter/domain/entity/article.dart';

Article getArticles() {
  return Article(
      title: 'kldsnklfdkfnklsdnfsdnfks ldsfklsdjfkjskdfs ñljdsfljskdfjsdfks',
      author: 'author',
      date: '2023-08-31T14:29:24Z',
      subtitle:
          'klaklasjdjasdlas klasdklajskldjkalsjd  kajsdlkajkdsasdk lajsdlkjakldjakdlal  lkansdkladkjaskd',
      imageUrl:
          "https://media.istockphoto.com/id/1249370846/es/foto/concepto-de-negocio-global-e-internacional-mundo-conectado-concepto-de-red-social.jpg?s=1024x1024&w=is&k=20&c=EiqDO-o3WGztUOTqQ-GAluDC_w6JWlK9RUQB_lQjns4=");
}

List<Article> get100Articles() {
  final list  = <Article>[];
  for(int i = 0; i<= 10; i++) {
    list.add(getArticles());
  }
  return list;
}