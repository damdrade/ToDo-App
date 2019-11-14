require 'rails_helper'

RSpec.describe User, type: :model do

	context "Testando a View User" do
		it "Cadastrar um usuário" do
			visit 'users/sign_up'

			within("#new_user") do
				fill_in 'Email', with: "new@teste.com"
				fill_in 'Password', with: "123senha"
				fill_in 'Password confirmation', with: "123senha"
			end
			click_button "Sign up"
			expect(page).to have_content "Welcome! You have signed up successfully."
		end
	end

	context "Validade de Usuário" do
		it "Usuário válido?" do
			user = User.new
			user.email = "dam@dam.com"

			expect(user.valid?).to be_truthy
		end

		it "Usuário inválido?" do
			user = User.new
			user.email = nil

			expect(user.valid?).to be_falsey
		end
	end
end