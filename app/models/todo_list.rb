class TodoList < ActiveRecord::Base
	 validates :title, presence: true, length: { minimum: 3}
end
