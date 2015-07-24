require "spec_helper"

describe "Create todo lists" do 

	def create_todo_list(options={})
		options[:title] ||= "This is a todo list"
		options[:Description] ||= "This is a describe of todo_lists"
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: options[:title]
		fill_in "Description", with: options[:description]
		click_button ("Create Todo list")

	end

	it "redirect to the todo list index page on success" do
		create_todo_list
		expect(page).to have_content("This is a todo list")
	end

	it "erro with no title" do
		expect(TodoList.count).to eq(0)
		create_todo_list(title: " ")
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is a todo list")
	end

	it "erro with no 3 characters" do
		expect(TodoList.count).to eq(0)
		visit "/todo_lists"
		click_link "Ne"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "hi"
		fill_in "Description", with: "This is a todo list"
		click_button ("Create Todo list")
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is a todo list")
	end
	it "erro with no 3 characters" do
		puts "erro with no 3 characters"
		expect(TodoList.count).to eq(0)
		visit "/todo_lists"
		click_link "Ne"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "hi"
		fill_in "Description", with: ""
		click_button ("Create Todo list")
		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is a todo list")
	end
end
