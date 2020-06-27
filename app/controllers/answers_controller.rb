class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end
end
