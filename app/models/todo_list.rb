class TodoList < ActiveRecord::Base
	 validates :title, presence: true, length: { minimum: 3}
	 has_many :todo_items
end
