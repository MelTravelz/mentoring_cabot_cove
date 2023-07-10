class CoursesController < ApplicationController
  def index
    @courses = Course.all.alphabetize
  end
end
