# encoding: UTF-8
require "spec_helper"
require "arena"

describe "Arena" do

  before do
    @arena = Arena.new(20, 20)
  end

  it "Criar a arena 20x20" do
    expect(@arena.width).to eq(20)
    expect(@arena.height).to eq(20)
  end
end

