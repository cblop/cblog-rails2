require 'spec_helper'

describe "Authentication" do
    subject { page }

    describe "signin" do
        before { visit signin_path }

        describe "with invalid information" do
            before { click_button "Sign in" }

            it { should have_selector('h1', text: 'Sign in') }
            it { should have_selector('div.alert.alert-error', text: 'Invalid') }

            describe "after visiting another page" do
                before { click_link "home" }
                it { should_not have_selector('div.alert.alert-error') }
            end
        end

        describe "with valid information" do
            let(:user) { FactoryGirl.create(:user) }
            before do
                fill_in "Name", with:user.name
                fill_in "Password", with: user.password
                click_button "Sign in"
            end

            it { should have_selector('div#title', text: 'article list') }
        end

    end
end
