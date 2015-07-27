require "spec_helper"
describe "editing_todo_lists " do
	it "update correctly after you updating this term" do
		todo_list = TodoList.create(title: "sPE,", description: "asdasd")


		visit "/todo_lists"
		within "#todo_list_#{todo_list.id}" do
			click_link "Edit"
		end

		fill_in "Title", with: "New "
		fill_in "Description", with: "asd"
		click_button ("Update Todo list")

		todo_list.reload

		expect(page).to have_content("Todo list was successfully")
		expect(todo_list.title).to eq("New ")
		expect(todo_list.description).to eq("asd")
	end
end