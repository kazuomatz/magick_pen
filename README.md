# Magick Pen
Plug-in that allows you to edit a Web page to direct. 

<img src="https://user-images.githubusercontent.com/2704723/117098232-dbe10400-ada8-11eb-8d50-e8dd87365a4b.gif".>


## Usage
The part of the erb file enclosed in <vue-magick-pen> 〜 </vue-magick-pen> tags can be edited.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'magick_pen'
```

And then execute:
```bash
$ bundle
$ rails g magick_pen:install  
```

## Start

- app/assets/stylesheets/application.css

add css from vue-magick-pen

```css
/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 
 *= require "vue-magick-pen/dist/vue-magick-pen"  
 */
 ```

- app/assets/javascript/application.js

add js from vue-magick-pen

```javascript
/*

//= require vue/dist/vue
//= require vue-magick-pen/dist/vue-magick-pen.umd

*/
 ```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
