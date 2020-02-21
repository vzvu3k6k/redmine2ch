require 'datpot/bbs'
require 'redmine2ch/resources'

require 'time'
require 'faraday'
require 'faraday_middleware'

module Redmine2ch
  class RedmineClient
    attr_reader :api_key, :root_url

    def initialize(api_key:, root_url:)
      @api_key = api_key
      @root_url = root_url
    end

    def issue(id:)
      raw_issue = connection.get("/issues/#{id}.json?include=journals").body[:issue]
      Resources::Issue.new(raw_issue)
    end

    def issues(project_id:)
      raw_issues = connection.get(
        "/projects/#{project_id}/issues.json?sort=updated_on%3Adesc%2Cid%3Adesc"
      ).body[:issues]
      raw_issues.map { |raw_issue| Resources::Issue.new(raw_issue) }
    end

    private

    def connection
      Faraday.new(root_url) do |c|
        c.request :json
        c.response :json, content_type: /\bjson$/, parser_options: { symbolize_names: true }
        c.headers = {
          'Content-Type' => 'application/json',
          'X-Redmine-API-Key' => api_key
        }
        c.adapter Faraday.default_adapter
      end
    end
  end
end
