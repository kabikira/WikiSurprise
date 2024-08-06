# WikiSurprise
WikiSurpriseは、GitHub-Flowでブランチ運用を練習するためのアプリケーションです。ウィキペディアのAPIからランダムに記事を取得し、それをテーブルビューのセルに表示し、セルをタップするとWebViewで記事を表示します。  
<img width="150" src="https://github.com/user-attachments/assets/81b2c6ea-3ef9-44e5-903b-5c856f8a5093">
<img width="150" src="https://github.com/user-attachments/assets/85bf76ef-2ce8-4b27-959e-4153fd6ed73a">
<img width="150" src="https://github.com/user-attachments/assets/71ab7dc9-9d9b-4ad9-81d4-c86320e945a0">
<img width="150" src="https://github.com/user-attachments/assets/706dabba-11bc-406c-a8f5-6af539a74730">
<img width="150" src="https://github.com/user-attachments/assets/faefe5fd-69c6-497a-bc70-1e6b36d4e205">


# 概要
* 設計 MVC  
* 画面遷移 Router  
* 外部ライブラリの使用なし  

## 自己評価
- 良い点:
	-  設計
		- Cocoa MVCで実装
		- Routerを使用により画面遷移に関する責務の分割した｡
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
    - NetworkMonitorにてアプリがネット回線と繋がっていないとき､通知アラートを実装
    - APIのリクエストの実装にてbaseURLが同じであれば､WikiAPI.swiftにstructを追加していくことでリクエストのコードを再利用できるように実装




- 問題点:
  - テストがない｡
  - 文字列を定数に代入しハードコードを防いでいるが､アプリ内で使う定数をファイルにまとめたほうがいいのかもしれない｡

### アウトプット
- UIInterpolatingMotionEffectの実装方法について記事を投稿しました｡[Qiita記事リンク](https://qiita.com/Imael/items/1f66307e08243bbea825) 





