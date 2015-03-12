# Chat Application with translation

Run these commands to try it out.

```
bundle
rake db:setup
rails s
```

This application involves two server faye & rails server

```
start faye server

   rackup private_pub.ru -s thin -E production

start rails server

   rails s


Requires Ruby 1.9.2 or later to run.
