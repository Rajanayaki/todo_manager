require 'date'

class TodosController < ApplicationController
  def index
    render "index"
  end 
  
  def show
    id = params[:id]
    todo = Todo.find(id)
    render "todo"
    #render plain: todo.to_pleasant_string
  end

  def create 
    todo_text = params[:todo_text]
    due_date= DateTime.parse (params[:due_date])
    todo= Todo.new( todo_text: todo_text, due_date: due_date , completed: false)
    todo.save
    response_text = "Todo is created with id #{todo.id}"
    redirect_to todos_path
  end
  
  def update
    id=params[:id]
    completed= params[:completed]
    todo=Todo.find(id)
    todo.completed= completed
    todo.save
    redirect_to todos_path
  end
  
  def destroy
    id= params[:id]
    todo = Todo.find(id)
    todo.destroy
  end 

  
end
