class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.children(self.path).select do |file|
            file.split(".").last == "mp3"
        end
    end

    def import
        self.files.each {|file| Song.new_by_filename(file)}
    end

end