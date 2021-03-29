require 'date'

class TodosController < ApplicationController
  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string} .join("\n")
  end 
  
  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create 
    todos_text = params[:todos_text]
    due_date= Date.today + (params[:due_date]).to_i
    todo= Todo.new( todo_text: todos_text, due_date: due_date , completed: false)
    todo.save
  end
  
  def update
    id=params[:id]
    todo=Todo.find(id)
    todo.completed=true
    todo.save
  end
  
  def destroy
    id= params[:id]
    todo = Todo.find(id)
    todo.destroy
  end 

  
end
