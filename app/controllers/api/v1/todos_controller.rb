class Api::V1::TodosController < ApplicationController

    def index
        @todos = Todo.all
        render json: @todos
    end



    def create
        @todo = Todo.create(todo_params)

        render json: @todo

        # if @todo.valid?
        #   render json: @todo
        # else
        #   render json: {errors: @todo.errors.full_messages}, status: unprocessable_entity
        # end
    end

    private

    def todo_params
        params.require(:todo).permit(:body, :completed, :user_id)
    end

end
