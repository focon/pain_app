require 'spec_helper'

describe "Complication pages" do
	subject { page }
	
	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "complication creation" do
			before { visit root_path }

			describe "with invalid information" do

					it "should not create a complication" do
					expect { click_button "Post" }.not_to change(Complication, :count)
					end

					describe "error messages" do
						before { click_button "Post" }
					it { should have_content('error') }
					end
			end

			describe "with valid information" do
						before { fill_in 'complication_content', with: "Lorem ipsum" }
						it "should create a complication" do
						expect { click_button "Post" }.to change(Complication, :count).by(1)
					end
			end

	end

  describe "complication_ destruction" do
    before { FactoryGirl.create(:complication, user: user) }
    
    describe "as correct user" do
      before { visit root_path }
      
      it "should delete a complication" do
        expect { click_link "delete" }.to change(Complication, :count).by(-1)
      end
    end
  end

 
end
