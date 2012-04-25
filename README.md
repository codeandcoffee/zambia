# codeandcoffee.info

Zambia is a Rails website created to organize Code and Coffee meetups.

Code and Coffee is an informal get together with the idea of getting out of bed early, hitting a coffee shop, and writing some code with fellow geeks for as long as you can stay. There are no requirements other than the willingness to sit down, pair up, and learn something new.

Its grassroots beginnings started in Columbus, OH and the Code and Coffee movement has
since spread via Twitter to other cities, such as Chicago, Indianapolis and Cleveland.

For more information, see [codeandcoffee.info](http://codeandcoffee.info).

You can generate the postgres databases with:

``` sh
bundle exec rake db:generate
bundle exec rake db:migrate
```

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

A big thanks to the fellas at [Test Double](http://test-double.com) for open sourcing
their [web site](http://github.com/testdouble/site) to make setting this up much easier. Only some renaming, rather than fighting with guard, the gemfile, and various config files for a while to get backbone, jasmine, rspec, etc, etc, etc all working and playing nicely together.
