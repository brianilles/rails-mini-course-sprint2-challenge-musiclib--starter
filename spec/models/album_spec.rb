require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    it "is valid" do
      # instantiate a valid album and ensure it is valid
      album = Album.new(name: "A really really cool Album")
      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be true
      expect(errors).to be_empty
    end

    it "is invalid without a name" do
      # instantiate an album without a name and ensure it is invalid
      album = Album.new(name: nil)
      result = album.valid?
      errors = album.errors.full_messages

      expect(result).to be false
      expect(errors).to inlcude("Album can't be blank")
    end
  end

  describe "attributes" do
    it "has expected attributes" do
      # ensure exactly the expected attributes are present on an album
      album = Album.new(name: "Cool Album")
      result = album.attribute_names.map(&:to_sym)

      # [:id, :name, :available, :artist_id, :created_at, :updated_at]
      expect(result).to contain_exactly(
        :id,
        :name,
        :available,
        :artist_id,
        :created_at,
        :updated_at
      )
    end
  end

  context "scopes" do
    describe "available" do
      it "returns a list of available albums sorted by name" do
        # set up a some available albums and unavailable albums and make expecations that the
        # available albums scope only returns available albums sorted by name
        Album.create([
         {name: "Cool Album", available: false},
         {name: "Cool Album2", available: false}, 
         {name: "Cool Album3", available: true}, 
         {name: "Cool Album4", available: true}])

        expect(Album.available.count) to eq 2
      end
    end
  end

  describe "#length_seconds" do
    it "calculates the total length in seconds of an album" do
      # setup a valid album and songs and make expecations about the return value of length seconds
      album = Album.new(name: "A really short album")

      result = album.length_seconds
      errors = album.errors.full_messages

      expect(result).to be 0
      expect(errors).to be_empty
    end
  end
end
