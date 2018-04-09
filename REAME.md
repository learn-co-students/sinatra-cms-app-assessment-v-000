#FlatIron School Sinatra Portfolio Project

My Sinatra Portfolio Project will be a simple app that will allow the All God's People organization to identify their clients and establish a unique user record in their SQL database.

### AGP Project Directory

The file directory tree view is as follows:

```
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   │   └── client_products_controller.rb
│   │   └── clients_controller.rb
│   │   └── products_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── client.rb
│   │   ├── clientproducts.rb
│   │   ├── product.rb
│   │   └── user.rb
│   └── views
│       ├── errors.erb
│       ├── index.erb
│       ├── layout.erb
│       ├── login.erb
│       ├── clients
│       │   ├── create_tweet.erb
│       │   ├── edit_tweet.erb
│       │   ├── show_tweet.erb
│       │   └── tweets.erb
│       └── users
│           ├── create_user.erb
│           └── login.erb
│           └── show.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 20151124191332_create_users.rb
│   │   └── 20151124191334_create_tweets.rb
│   ├── schema.rb
│   └── test.sqlite
└── spec
    ├── controllers
    │   └── application_controller_spec.rb
    └── spec_helper.rb
```
