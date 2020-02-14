class Api::V1::TodosController < ApplicationController

    def index
        @todos = Todo.all
        render json: @todos
    end

    def show    
        @todo = Todo.find(todo_params)
        render json: @todo
    end

    def update
        @todo = Todo.find(params[:id])

        if @todo
            @todo.update(todo_params)
            render json: @todo
        else
            render json: {errors: @todo.errors.full_messages}, status: unprocessable_entity
        end

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
