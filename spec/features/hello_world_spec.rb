feature 'hello world' do
  scenario 'visit hellow world page' do
    visit '/hello-world'
    expect(page).to have_content('Hello World')
  end
end