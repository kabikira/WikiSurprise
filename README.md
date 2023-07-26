# WikiSurprise
WikiSurpriseは、GitHub-Flowでブランチ運用を練習するためのアプリケーションです。ウィキペディアのAPIからランダムに記事を取得し、それをテーブルビューのセルに表示し、セルをタップするとWebViewで記事を表示します。  
# 概要
* 設計 MVC  
* 画面遷移 Router  
* 外部ライブラリの使用なし  

Tag V1.0 はAppStoreの初回審査に出したVer  
Tag V1.1は細かな修正を行いアップデード

## ディレクトリの説明  
* **AppIntroduction:** ユーザーがアプリをインストールして初回起動時に表示されるチュートリアル画面のためのコンポーネントが含まれています。  
* **Article:** ウィキペディアのAPIから取得した記事のタイトルをテーブルビューのセルに表示する主要なビューコンポーネントが含まれています。  
* **Web:** Articleでタップされた記事のURLをWebViewで表示するためのコンポーネントが含まれています。  
* **Info:** アプリのお問い合わせやアプリの説明などの項目をテーブルビューで表示するコンポーネントが含まれています。  
* **PrivacyPolicy:** Infoで表示されたプライバシーポリシーの項目がタップされたときに、アプリのプライバシーポリシーページをWebViewで表示するコンポーネントが含まれています。  
* **Model:** アプリのモデルに関連するファイルが含まれています。Article.swiftはウィキペディアの記事を表し、InfoItem.swiftはアプリ内の情報項目を表します。  
* **Utility:** ユーティリティクラスが含まれています。APIディレクトリにはAPIのレスポンスやエラー処理に関する機能が、他にRouter､NWPathMonitorを使用したネットワーク接続を監視するクラスなどを持っています｡  



