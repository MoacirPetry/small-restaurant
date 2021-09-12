RSpec.shared_examples :new_examples do
  subject { get :new }
  it 'render the new template' do
    expect(subject).to render_template(:new)
  end
  it 'returns http success' do
    expect(subject).to have_http_status(:success)
  end
end
