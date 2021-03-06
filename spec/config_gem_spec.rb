# frozen_string_literal: true

RSpec.describe ConfigGem do
  let!(:new_obj) do
    att = {'logo_url': 'something'}
    ConfigGem::Config.new(att)
  end

  # init instance with block
  let!(:init_instance) do 
    ConfigGem::Config.new.tap do |c|
      c.set :logo, 'logo_url'
    end
  end
  

  it '`get` returns the stored value (nil for non-existing)' do
    new_obj.set(:logo, 'logo_url')
    expect(new_obj.get(:logo)).to eq 'logo_url'
    expect(new_obj.get(:nil_attr)).to eq nil
  end

  it "`set` stores the data inside the instance" do
    new_obj.set(:logo, 'logo_url')
    expect(new_obj.get(:logo)).to eq 'logo_url'
  end

  it "the class may be initialized with a block" do
    expect(init_instance.get(:logo)).to eq 'logo_url'
  end
  
  it "`set` may receive a block for the value" do
    new_obj.set do |c|
      c.attributes = {
        'domain': 'domain_name'
      }
    end
    expect(new_obj.attributes[:domain]).to eq 'domain_name'
  end
end
