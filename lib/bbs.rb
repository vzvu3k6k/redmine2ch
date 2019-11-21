# frozen_string_literal: true

require 'sinatra/base'
require 'datpot/board'

class Bbs < Sinatra::Application
  def subject_txt(_board_id)
    raise NotImplementedError
  end

  def dat(_board_id, _dat_id)
    raise NotImplementedError
  end

  get '/:board_id/subject.txt' do
    content_type 'plain/text'
    subject_txt(params['board_id']).encode('cp932')
  end

  get '/:board_id/dat/:dat_id.dat' do
    content_type 'plain/text'
    dat(params['board_id'], params['dat_id']).encode('cp932')
  end
end
