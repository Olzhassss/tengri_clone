# Setting up

1. Install ruby (version 3.2.2)
2. Run `ruby bin/bundle install`
3. Set up the database (SQLite) `ruby bin/rake db:schema:load`
4. Populate the database with test data `ruby bin/rails db:seed`
5. Run `ruby bin/rails server`
6. Open on `127.0.0.1:3000`
