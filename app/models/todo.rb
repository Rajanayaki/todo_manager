require 'date'
class Todo < ActiveRecord::Base
  belongs_to :user

  def self.of_user(user)
    all.where(user_id: user_id)
  end

  def due_today?
    due_date == Date.today 
  end

  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end
  
  def self.completed
    all.where(completed: true)
  end 

  def self.show_list
    puts "My Todo-list"
    puts "Overdue"
    puts overdue.show_list
    puts "Due Today"
    puts due_today.show_list
    puts "Due Later"
    puts due_later.show_list
  end
end