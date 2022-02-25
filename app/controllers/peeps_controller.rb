class PeepsController < ApplicationController
  def index
    @peeps = Peep.all
  end
end
