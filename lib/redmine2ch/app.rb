# frozen_string_literal: true

require 'datpot/bbs'
require 'datpot/thread'
require 'datpot/response'
require 'redmine2ch/redmine_client'

module Redmine2ch
  class App < Datpot::Bbs
    def threads(board_id:)
      redmine_client.issues(project_id: board_id).map { |issue|
        detailed_issue = redmine_client.issue(id: issue.id)
        Datpot::Thread.new(
          thread_id: issue.id,
          title: issue.subject,
          response_count: detailed_issue.journals.size + 1
        )
      }
    end

    def responses(board_id:, thread_id:)
      issue = redmine_client.issue(id: thread_id)
      [
        Datpot::Response.new(
          author: issue.author,
          email: '',
          posted_at: issue.created_on,
          content: issue.description
        )
      ] + issue.journals.map { |journal|
        Datpot::Response.new(
          author: journal.author,
          email: '',
          posted_at: journal.created_on,
          content: journal.content
        )
      }
    end

    private

    def redmine_client
      @redmine_client ||= RedmineClient.new(
        api_key: ENV['REDMINE_API_KEY'],
        root_url: ENV['REDMINE_URL']
      )
    end
  end
end
