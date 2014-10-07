class DemoController < ApplicationController
  def show
    uuid = params[:uuid]
    if uuid
      @person = Person.find_by_uuid(uuid)
    end
  end
end