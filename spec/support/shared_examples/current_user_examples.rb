RSpec.shared_examples :current_user_examples do
  context 'Checking current_user' do
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  end
end
