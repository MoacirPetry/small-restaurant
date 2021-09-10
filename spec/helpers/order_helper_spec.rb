require 'rails_helper'

RSpec.describe OrderHelper, type: :helper do

  context 'when completed function is called' do
    it 'true?' do
      expect(completed(true)).to eq('Completed')
    end
    it 'false?' do
      expect(completed(false)).to eq('Open')
    end
    it '!true?' do
      expect(completed(false)).not_to eq('Completed')
    end
    it '!false?' do
      expect(completed(true)).not_to eq('Open')
    end
    it '!nil?' do
      expect(completed(false)).not_to eq(nil)
    end
    it 'param?' do
      expect{ completed }.to raise_error(ArgumentError)
    end
  end

end
