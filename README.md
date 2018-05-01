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
│   │   ├── clientproduct.rb
│   │   ├── product.rb
│   │   └── user.rb
│   └── views
│       ├── error.erb
│       ├── index.erb
│       ├── layout.erb
│       ├── login.erb
│       ├── clients
│       │   ├── edit.erb
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── show.erb
│       ├── products
│       │   ├── edit.erb
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── show.erb
│       └── users
│          ├── edit.erb
│          ├── index.erb
│          ├── new.erb
│          └── show.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 01_create_users.rb
│   │   └── 02_create_products.rb
│   │   ├── 03_create_clients.rb
│   │   └── 04_create_client_products.rb
│   ├── schema.rb
│   └── seeds.rb
└── dist
└── public
```
