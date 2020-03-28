class Memo {
  final String id;
  final String title; // 제목
  final String text;  // 문서
  final String createTime; // 생성 시간
  final String editTime;   // 작성 시간

  Memo({this.id, this.title, this.text, this.createTime, this.editTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'text': text,
      'createTime': createTime,
      'editTime': editTime,
    };
  }

  // 각 memo 정보를 보기 쉽도록 print 문을 사용하여 toString을 구현하세요
  @override
  String toString() {
    return 'Memo{id: $id, title: $title, text: $text, createTime: $createTime, editTime: $editTime}';
  }
}