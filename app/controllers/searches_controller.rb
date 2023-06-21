class SearchesController < ApplicationController
  
  def search
    @word = params[:word]
    @model = params[:model]
    @method = params[:method]
    if @model == "question"
      @records = Question.search_for(@word)
    else
      @records = Answer.search_for(@word)
    end
  end
  
end
