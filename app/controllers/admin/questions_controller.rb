class Admin::QuestionsController < Admin::BaseController

	def show
		@questions = Question.all
	end

	def new
		@question = Question.new
	end
	
end