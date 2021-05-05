# Magick Pen

Magick Penは、Railsプロジェクトに組み込んで利用できるGemのプラグインです。 
テンプレートファイル(.erbファイル)の任意の部分を

```
<vue-magick-pen> 〜 </vue-magick-pen> 
```


で囲むだけで、Webページから直接変更ができるようになります。

また、変更内容を履歴管理していますので、過去の内容に戻すことも簡単です。

<img src="https://user-images.githubusercontent.com/2704723/117098232-dbe10400-ada8-11eb-8d50-e8dd87365a4b.gif"/>


## Installation

あなたのRailsプロジェクトの Gemfiie に magick_penを追加します。

```ruby
gem 'magick_pen'
```

bundleを更新して、Magick Penのインストールとmaigrationを以下の手順で実行します。

```bash
$ bundle
$ rails g magick_pen:install --with-migrate
```

## 準備

ここでは、Rails Sprocketsを使ってアセットコンパイルして利用する方法を説明します。

### app/assets/stylesheets/application.css

nodeモジュールからmagick penのcssを読み込みます。

```css
/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 
 *= require "vue-magick-pen/dist/vue-magick-pen"  
 */
 ```

### app/assets/javascript/application.js

nodeモジュールからvue.jsと magick penのVueコンポーネントを読み込みます。


```javascript
/*

//= require vue/dist/vue
//= require vue-magick-pen/dist/vue-magick-pen.umd

*/
 ```


### app/views/layouts/application.html.erb

```html
  <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
  <%= javascript_include_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
```

layouts/application.html.erb から application.jsと application.cssを読み込めば準備は完了です。

# ページを作成する

### app/views/xxxxx/index.html.erb

任意のコントローラー、アクションを作成し、テンプレートファイルをマークアップします。

```html
<div id="magick-pen">
    <h1>Title</h1>
    <div>
        <magick-pen pen-key="snippet-1">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
            Mauris pellentesque malesuada convallis.
            Quisque condimentum ac odio ut congue. Integer ultrices a erat sed hendrerit.
        </magick-pen>
    </div>

    <div>
        <magick-pen pen-key="snippet-2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            Mauris pellentesque malesuada convallis.
            Quisque condimentum ac odio ut congue. Integer ultrices a erat sed hendrerit.
        </magick-pen>
    </div>
</div>

<%= render partial: 'magick_pen/load', locals: { editable: true } %>

```

マークアップのルールは以下の通りです。
- id="magick-pen" で 囲った部分が有効になります。この範囲内であれば、何か所でも Magick Pen を埋め込めます。
- magick penを埋め込みたい部分を <vue-magick-pen> 〜 </vue-magick-pen> で囲みます。
- この時、キーとなる文字列を pen-key属性に設定して下さい。
- pen-key は (コントローラー名＋アクション名) のスコープでユニークとなるようにして下さい。別コントローラー、別アクションであれば、同じpen-keyでも別物として扱われます。
- ページフッターやサイドバーなどサイト全体で共通に扱いたい部分でMagick Penを埋め込みたい場合は、pen-keyにプレフィックス 'g-' を付けて下さい (例：g-snippet-1)。
- ファイルの最後に  <%= render partial: 'magick_pen/load', locals: { editable: true } %>  を記述します。
- editableが falseであれば、何もなかったように普通にページが表示されます。trueであれば編集可能になります。ユーザー権限などに応じてeditableの値をコントロールして下さい。
- id="magick-pen" の値を変更したい場合は、'magick_pen/load' の locals に、elementを渡すことができます。

```html
<div id="page">
    :
    :
    :
    
</div>
<%= render partial: 'magick_pen/load', locals: { editable: true, element: '#page" } %>
```

Magick Penは多言語対応になっていますので、ボタン名に日本語が表示されない場合は、config/application.rbに以下の設定をします。

```ruby
  class Application < Rails::Application
    :
    :    
    I18n.available_locales = %i(ja en)
    I18n.enforce_available_locales = true
    I18n.default_locale = :ja
  end
```



# デザインの適用

FontAwesome 5 を導入することをお奨めします。FontAwesomeが利用できる環境であればそのままボタン等にアイコンが表示されます。

Bootstrap 4、または、Bulma を適用した場合は、各CSSフレームワークのデザインに準じて表示されます。独自デザインを適用する場合は、CSSの調整が必要になります。

gemバンドル内の magick_pen/app/models/magick_pen/snippet.rb を プロジェクトにコピーして適宜変更をして下さい。snippet.rbには、
Magick Pen内で使用するボタンのクラス名やラベル名、アイコンのクラス名が定義されています。



# サンプルプロジェクト

[ こちら ]( https://github.com/kazuomatz/magick_pen_demo )にサンプルのRailsプロジェクトがあります。



# 動作環境
- Ruby 2.6 〜 3.0
- Rails 6.0 / 6.1


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
