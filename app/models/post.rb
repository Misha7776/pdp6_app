# frozen_string_literal: true

class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  BOOLEAN_FIELDS = ['published'].freeze

  settings do
    mappings dynamic: false do
      indexes :author, type: :text
      indexes :title, type: :text, analyzer: :english
      indexes :body, type: :text, analyzer: :english
      indexes :tags, type: :text, analyzer: :english
      indexes :published, type: :boolean
    end
  end

  # multi match
  def self.search_with_filters(query, filters)
    search({
             query: {
               bool: {
                 must: [
                   {
                     multi_match: {
                       query: query,
                       fields: %i[author title body tags]
                     }
                   },
                   {
                     match: prepare_filters(filters)
                   }
                 ]
               }
             }
           })
  end

  # full text
  def by_auther(author_query)
    search(
      body: {
        query: {
          match: {
            author: {
              query: author_query
            }
          }
        }
      }
    )
  end

  def multiple_conditions
    search(
      body: {
        query: {
          bool: {
            must: [
              {
                match: {
                  title: 'Search'
                }
              },
              {
                match: {
                  body: 'Elasticsearch'
                }
              }
            ],
            filter: [
              {
                term: {
                  status: 'published'
                }
              },
              {
                range: {
                  publish_date: {
                    gte: '2015-01-01'
                  }
                }
              }
            ]
          }
        }
      }
    )
  end

  def published_term_query
    search(
      body: {
        query: {
          term: {
            published: true
          }
        }
      }
    )
  end

  def self.prepare_filters(filters)
    filters.to_h.map do |key, value|
      if BOOLEAN_FIELDS.include?(key)
        [key, ActiveModel::Type::Boolean.new.cast(value)]
      else
        [key, value]
      end
    end.to_h
  end
end
