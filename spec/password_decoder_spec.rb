require_relative "../lib/password_decoder.rb"

RSpec.describe PasswordDecoder do
  subject(:password_decoder) { described_class.new(rotations).call }

  context "with the provided example" do
    let(:rotations) { %w(L68 L30 R48 L5 R60 L55 L1 L99 R14 L82) }

    it { is_expected.to eq 3 }
  end

  context "with no hits" do
    let(:rotations) { %w(L68) }

    it { is_expected.to eq 0 }
  end

  context "with one hit" do
    let(:rotations) { %w(R50) }

    it { is_expected.to eq 1 }
  end

  context "with two hits" do
    let(:rotations) { %w(R50 L1 R1) }

    it { is_expected.to eq 2 }
  end

  context "with the real input" do
    let(:rotations) do
      File.open("inputs/day1_input.txt").read.split("\n")
    end

    it { is_expected.to eq 1152 }
  end
end
