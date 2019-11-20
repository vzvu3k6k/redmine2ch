# frozen_string_literal: true

require 'sinatra/base'
require 'datpot/board'

class Bbs < Sinatra::Application
  get '/redmine/subject.txt' do
    content_type 'plain/text'
    subject_txt.encode('cp932')
  end

  get '/redmine/dat/1234.dat' do
    content_type 'plain/text'
    dat.encode('cp932')
  end
end
