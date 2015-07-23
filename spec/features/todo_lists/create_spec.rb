require "spec_helper"

describe "Create todo lists" do 

	it "redirect to the todo list index page on success" do
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "My todo_lists"
		fill_in "Description", with: "This is what I amdoing"
		click_button ("Create Todo list")
		expect(page).to have_content("My todo_lists")
	end

	it "erro with no title" do
		expect(TodoList.count).to eq(0)
		visit "/todo_lists"
		click_link "Ne"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: ""
		fill_in "Description", with: "This is what I amdoing"
		click_button ("Create Todo list")
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I amdoing")
	end

	it "erro with no 3 characters" do
		expect(TodoList.count).to eq(0)
		visit "/todo_lists"
		click_link "Ne"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "hi"
		fill_in "Description", with: "This is what I amdoing"
		click_button ("Create Todo list")
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I amdoing")
	end

end
