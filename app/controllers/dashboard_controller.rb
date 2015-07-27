class DashboardController < ApplicationController

  def show
    @files = dropbox.ls
  end

end
