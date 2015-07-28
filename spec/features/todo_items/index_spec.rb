require 'spec_helper'

describe "Viewing todo items" do 
 let! (:todo_list) {TodoList.create(title: "Grocery list", description: "something")}

 def visit_todo_list(list)
 	visit "/todo_lists"
 	within "#todo_list_#{list.id}" do
 	click_link "Todo Items"
 	end
 end	

 def creating_item(some)
 	todo_list.todo_items.create(content: some)
 end

 it "display title" do
 	visit_todo_list(todo_list)
 	expect(page.all(".ul.todo_items li").size).to eq 0
 end


 it "s dsfsd  dasdasd" do
 	visit_todo_list(todo_list)
 	expect(page).to have_content("TodoItems#index")
 end

 it "should have some items" do
 	creating_item("Milk")
 	visit_todo_list(todo_list)
 	expect(page.all("ul.todo_items li").size).to eq(1)
 	within "ul.todo_items" do
 		expect(page).to have_content("Milk")
	end
 end	
end