class LecturesController < ApplicationController

  # GET /subjects/1/lectures
  # GET /subjects/1/lectures.json
	def index
		@lectures = Lecture.all
	end
  # GET /subjects/1/lectures/1
  # GET /subjects/1/lectures/1.json
 	def show
 	end

  # GET /subjects/lectures/1/edit
    def edit
    end
  # POST /subjects/1/lectures
  # POST /subjects/1/lectures.json
  	def create
    	@lecture = Lecture.new(lecture_params)

   		respond_to do |format|
      		if @lecture.save
        		format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        		format.json { render action: 'show', status: :created, location: @lecture }
      		else
        		format.html { render action: 'new' }
        		format.json { render json: @lecture.errors, status: :unprocessable_entity }
      		end
    	end
  	end

end
