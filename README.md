# test-double.com

This is Zambia's website, [test-double.com](http://test-double.com).

You can run the app with:

``` sh
bundle exec rails s
```

You can run the cukes with:

``` sh
bundle exec cucumber
```

You can run the jasmine specs by navigating to [/specs](http://localhost:3000/specs). You can also run the specs with `jasmine-headless-webkit`. (See [its docs](http://johnbintz.github.com/jasmine-headless-webkit/) for instructions). I personally run jasmine under guard, with:

``` sh
bundle exec guard -g js
```
