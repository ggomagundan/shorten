# ShortenURL
Make Shorten URL Using [bijective Algorithm](http://en.wikipedia.org/wiki/Bijection)

It is running on `Ruby 2.2.0`, `Rails 4.2.0`,

Reference Code : [zumbojo/bijective.rb](https://gist.github.com/zumbojo/1073996)


## Pre-Requisites
Only need install `ruby` and `rails` and bundle **Gemfile**
```bash
$ mv config/database.yml.sample config/database.yml

$ bundle install
```

* If  you use another database(**MySQL**, **MariaDB**, **PostgreSQL** ...), 
You modify `config/database  .yml`


## Demo
```bash
$ rails c
```
```bash
irb > require 'shorten_url'

irb > ShortenUrl.encode_url(123456789)
   => "iwaUH"

# Decoding string mentioned in original SO question:
irb > puts  ShortenUrl.decode_url("iwaUH")
   => 123456789
```

## Customization

You can customize **Shorten URL** modify  `lib/shorten_url.rb` **ALPHABET** variable 

 * Make your own alphabet 
 
  ```bash
 irb > (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join
     => "iHY4Pm2Gqr9tf3csnzMCJOdoAgxZ1yN85XIeLDFp0lK6VbvUakwhBWuESjR7TQ" 

  ```
 * Add Another words
   
   You can add ALPHABET Variable (ex. `_`, `-`, ...)
  
  
  After change ALPHABET Variable ,You get another ShortURL

## License
### This code is free to use under the terms of the MIT license.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
