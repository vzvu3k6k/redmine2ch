require 'sinatra/base'
require 'datpot/board'

get '/redmine/subject.txt' do
  content_type 'plain/text'

  Datpot::Board.new.subject_txt.encode('cp932')
end

get '/redmine/dat/1234.dat' do
  content_type 'plain/text'

  Datpot::Thread.new.dat.encode('cp932')
end
