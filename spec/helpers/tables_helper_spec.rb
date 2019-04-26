require 'rails_helper'

RSpec.describe TablesHelper, type: :helper do

  context 'when availability function is called' do
    it "true?" do
      expect(availability(true)).to eq("Busy")
    end
    it "false?" do
      expect(availability(false)).to eq("Free")
    end
    it "!true?" do
      expect(availability(false)).not_to eq("Busy")
    end
    it "!false?" do
      expect(availability(true)).not_to eq("Free")
    end
    it "!nil?" do
      expect(availability(false)).not_to eq(nil)
    end
    it "!param?" do
      expect{ availability }.to raise_error(ArgumentError)
    end
  end

end
