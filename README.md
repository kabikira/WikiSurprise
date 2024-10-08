# WikiSurprise
WikiSurpriseは、ウィキペディアのAPIからランダムに記事を取得し、それをテーブルビューのセルに表示し、セルをタップするとWebViewで記事を表示します。  
<img width="150" src="https://github.com/user-attachments/assets/81b2c6ea-3ef9-44e5-903b-5c856f8a5093">
<img width="150" src="https://github.com/user-attachments/assets/85bf76ef-2ce8-4b27-959e-4153fd6ed73a">
<img width="150" src="https://github.com/user-attachments/assets/71ab7dc9-9d9b-4ad9-81d4-c86320e945a0">
<img width="150" src="https://github.com/user-attachments/assets/706dabba-11bc-406c-a8f5-6af539a74730">
<img width="150" src="https://github.com/user-attachments/assets/faefe5fd-69c6-497a-bc70-1e6b36d4e205">


# 概要
* 設計 MVC  
* 画面遷移 Router  
* 外部ライブラリの使用なし

## 作成理由　　
APIからのデータを取得したアプリを作成したかったため、  
普段興味を持つことがないようなテーマについて、新しい知識や視点を発見できるようにするため作成。　　

## 自己評価
- 工夫した点:
	-  設計
		- Cocoa MVCで実装
		- Routerパターンの使用により画面遷移に関する責務の分割した｡
	- レイアウト
		- ライト､ダークモードに対応
		- UIInterpolatingMotionEffect使用しジャイロセンサーを利用したエフェクトを実装
		- レイアウト変更に柔軟に対応できるようできるだけ､UIStackViewを使用した｡
		- UserDefaultsでアプリ起動時の画面を制御
		- Storyboard開く際のロード時間を短縮､編集､共同開発しやすいように1Storyboard, 1ViewControllerとした｡
  		- セルを再使用するように実装
  - その他
    - アプリ初回起動時にアプリのチュートリアルを実装
    - WikiAPIのエラーハンドリングを行った｡
    - issueを立てアプリの課題を可視化し､その課題に対してブランチを切って対応した｡
    - 非同期処理をasync/awaitで実装 https://github.com/kabikira/WikiSurprise/pull/93
    - NetworkMonitorでネットワーク接続を感知し、機内モード、ネットワークに繋がってない時にアラート出すよう実装
    - APIのリクエストの実装にてbaseURLが同じであれば､WikiAPI.swiftにstructを追加していくことでリクエストのコードを再利用できるように実装
    - falstlaenにてユニットテスト実行､メタデータ更新､デバッグビルド､リリースビルド､appstoreにアップロード自動化 https://github.com/kabikira/WikiSurprise/pull/115




- 問題点:
  - ~テストがない｡~ https://github.com/kabikira/WikiSurprise/pull/114 にてAPIに関するテストコード実装
  - 文字列を定数に代入しハードコードを防いでいるが､アプリ内で使う定数をファイルにまとめたほうがいいのかもしれない｡

### アウトプット
- UIInterpolatingMotionEffectの実装方法について記事を投稿しました｡[Qiita記事リンク](https://qiita.com/Imael/items/1f66307e08243bbea825) 





