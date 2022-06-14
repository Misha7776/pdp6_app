# PDP #6

### System dependencies

* Ruby version: 3.0.2
* Rails 7.0.3
* PostgreSQL Database
* Redis Search
  * To run Redis with RedisSearch module run ``docker run -p 6379:6379 redislabs/redisearch:latest``
  * Working model `Product`. Seed the db with records and `Product.reindex(recreate: true)`
* Kredis. Advanced features of redis in one gem.
  * Working model `Person`.
* Elastic Search
  * Documentation: https://rubydoc.info/gems/elasticsearch-model/ | https://rubydoc.info/gems/elasticsearch-persistence/ | https://rubydoc.info/gems/elasticsearch-rails
  * DSL documentation - https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl.html
  * To run elastic search run ``docker-compose up -d ``
  * You can check elasticsearch on http://localhost:9200/
  * You can check Kabana on http://localhost:5601/app/home
  * Working model `Post`. Seed the db with records and run `Post.import`
  
* DB Views
  * Materialized view - `DbStatistic.all`
  * To refresh the view run: `DbStatistic.all`


## Project Setup
* Run this commands
* ``bundle install``
* ``rails db:setup``
