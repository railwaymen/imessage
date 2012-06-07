class MessageController < ApplicationController
  
  def index
    Notifier.notify(params[:to])
  end

end
