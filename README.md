# README


Clone the repository
$ git clone git@github.com:juliendargelos/project.git
$ cd project

Check your Ruby version
$ ruby -v
The ouput should start with something like ruby 3.3.1 

If not, install the right ruby version using rbenv (it could take a while):

rbenv install 3.3.1 

Install dependencies
Using Bundler and Yarn:

$bundle && yarn
$ gem install tailwind-sorter
$ bundle binstubs tailwind-sorter

Initialize the database
$ rails db:create db:migrate db:seed

Serve
$bin/dev


