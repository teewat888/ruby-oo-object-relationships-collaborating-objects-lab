class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name =name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(name)
        split_name = name.split(" - ")
        song_name = split_name[1]
        artist_name = split_name[0]
        song = Song.new(song_name)
        artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(song)
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end