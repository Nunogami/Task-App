# サンプルアプリケーション

このアプリケーションを土台として、タスク管理機能を持つアプリへ拡張していただきます。

## 開発環境

* AWS Cloud9
* Ruby
* Git
* Heroku

```
$ git clone https://github.com/sample-874/sample-app.git
```

上記のコマンド実行（リポジトリをクローン）後、
次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

マイグレーション実行後、サンプルユーザーを生成します。

```
$ rails db:seed
```

これでRailsサーバーを立ち上げる準備が整いました。

```
$ rails server
```

ユーザーの新規作成やログインなどは既に出来る状態になっているはずです。

* **email** : sample@email.com
* **password** : password

# 勤怠システムを開発しよう！

これはセレブエンジニアサロンの教材で作られたサンプルアプリケーションです。

## 開発環境

* AWS Cloud9
* Ruby
* Rails
* Git(HTTPSからSSH通信へ変更)


  <ul>
    <li>ルートURLに対応したトップページ（このページです）</li>
    <li>ユーザー機能
      <ol>
        <li>名前・メールアドレス・パスワード・ログイン認証用のカラムを持ったUserモデル</li>
        <li>ユーザー新規登録と対応したページ</li>
      </ol>
    </li>
    <li>ログイン機能
      <ol>
        <li>セッションによる一時的ログイン機能</li>
        <li>Cookiesによる永続的ログイン機能</li>
      </ol>
    </li>
  </ul>
  <p>実質【勤怠チュートリアル第７章】までの機能を持ったアプリケーションとなります。</p>
  
          <% if current_user.admin? && !current_user?(user) %>
            <%= link_to "削除", user, method: :delete,
                data: { confirm: "削除してよろしいですか？" },
                class: "btn btn-danger" %>
          <% end %>