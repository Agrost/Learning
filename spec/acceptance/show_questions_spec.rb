feature 'Create question', %q{
In order to get questions from community
And watch them
I want to be able to ask questions
} do
  given(:user) {create (:user)}
  given(:question) { create(:question) }
  scenario 'user views questions' do
   sign_in(user)
   question
   question2 = create(:question)
   visit root_path
   expect(page).to have_content question.title
   expect(page).to have_content question.body
   expect(page).to have_content question2.title
   expect(page).to have_content question2.body
 end
end
