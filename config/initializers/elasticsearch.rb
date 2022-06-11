# frozen_string_literal: true

config = {
  host: ENV['ELASTICSEARCH_URL'],
  reload_connections: true,
  reload_on_failure: true,
  transport_options: {
    request: { timeout: 5 }
  }
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
