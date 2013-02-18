# keen-aes-example

A simple example that shows how to encrypt your API token and
other filters when working with the Keen IO API.

### Usage

Use it like so:

    token = Keen::Token.new("my-api-key", { "filters" => [{
      "property_name" => "accountId",
      "operator" => "eq",
      "property_value" => "123456"
    }])
    token.encrypt! # "4d1982fe601b359a5cab7ac7845d3bf27026936cdbf8ce0ab4ebcb6930d6cf7f139e..."

Use the result as the authorization object for future queries, and those queries
will be scoped to the given filters. Your API Key cannot be reverse engineered
from the AES-256 encrypted token.

### Specs

Check out the spec folder for more detail. You can run the specs like so:

    bundle install
    bundle exec rake


