require "spec_helper"

describe "Create todo lists" do 

	def editing_todo_lists(options={})
		todo_lists = TodoList.creat()
	end

	describe "editing_todo_lists " do
		it "update correctly after you updating this term"
			visit "/todo_lists"
			click_link "Edit"
		end
	end
end