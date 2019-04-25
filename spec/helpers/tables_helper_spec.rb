require 'rails_helper'

RSpec.describe TablesHelper, type: :helper do

  it { expect(availability(false)).to eq("Busy").or eq("Free") }

end
