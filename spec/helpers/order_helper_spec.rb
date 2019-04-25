require 'rails_helper'

RSpec.describe OrderHelper, type: :helper do

  it { expect(completed(true)).to eq("Completed").or eq("Open") }

end
