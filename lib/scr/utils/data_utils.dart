import '/scr/models/personal_information.dart';

class DataUtils {
  Future<List<PersonalInfoItem>> loadPersonalInfoItems() async {
    // 仮のデータリスト
    List<PersonalInfoItem> items = [
      PersonalInfoItem(
        id: "0",
        notificationTag: "thisMonth", // このアイテムは「今月の予定」に分類されます
        name: "斉藤百済",
        phoneNumber: "08011112222",
        email: "hyakusai.saito@example.com",
        companyName: "株式会社百済",
        post: "代表取締役",
        note: "重要なクライアント"
      ),
      PersonalInfoItem(
        id: "1",
        notificationTag: "other", // このアイテムは「その他」に分類されます
        name: "フォークリフト次郎",
        phoneNumber: "08033334444",
        email: "forklift.jiro@example.com",
        companyName: "株式会社フォーク",
        post: "物流部長",
        note: "物流最適化プロジェクト担当"
      ),
      PersonalInfoItem(
        id: "2",
        notificationTag: "thisMonth", // このアイテムも「今月の予定」に分類されます
        name: "遠田藤太",
        phoneNumber: "08055556666",
        email: "tohta.enda@example.com",
        companyName: "遠田商事",
        post: "営業部 部長",
        note: "新規開拓チームリーダー"
      ),
      PersonalInfoItem(
        id: "3",
        notificationTag: "other", // このアイテムも「今月の予定」に分類されます
        name: "岸田文雄",
        phoneNumber: "08056737564",
        email: "kishidaaaaa@example.com",
        companyName: "内閣府",
        post: "内閣総理大臣(検討志)",
        note: "増税クソメガネ"
      ),
    ];

    // 本番環境では外部データソースからの読み込みなど、適切なデータ取得方法を実装してください。
    return items;
  }
}