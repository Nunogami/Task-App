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
          
C1
String (文字列が２５５字まで)
名前
住所
電話番号
会社名
Text　(それ以上)
コンテンツ
コメント
段落

rails g model Task task_name:string task_description:text user:references
rails db:migrate
C2
has_many :tasks, dependent: :destroy

rails c -s
task = Task.new
task.valid?
task.errors.full_messages
C3
rails g controller tasks index

C4
C5
  # 作成日を指定のフォーマットで指定  
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
  end
C6
C7
C8
C9
C10
C11
C12
C13
    <%= raw Rink.auto_link(@task.task_description, :all, 'target="_blank"') %>
D1
D2
D4
D5
D6
D7

users = User.order(:created_at).take(3)
50.times do
    name = "タスク-#{n+1}",
    description = "詳細-#{n+1}"
    users.each { |user| user.tasks.create!(task_name: name, task_description: description ) }
end