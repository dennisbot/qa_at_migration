module QaAtMigration
  class Generator
    CONFIG_FILE       = 'config.yml'.freeze
    CONFIG_IGNORE_KEY = 'ignore'.freeze
    TEST_FILE_PATTERN = '**/*.md'.freeze
    CSV_HEADERS       = %w(Title Description Preconditions Steps Status).freeze

    def generate sourcepath, targetpath, output_filename = 'master.csv'
      @sourcepath = sourcepath ? sourcepath : Dir.pwd
      output_path_filename = targetpath ? File.join(targetpath, output_filename) : output_filename
      CSV.open(output_path_filename, 'w', headers: CSV_HEADERS, write_headers: true) do |csv|
        paths.each { |path| csv << TestFile.new(path).content }
      end
    end

    private

    def paths
      Dir.glob(File.join(@sourcepath, TEST_FILE_PATTERN), File::FNM_CASEFOLD).reject do |filename|
        File.directory?(filename) || File.basename(filename).start_with?(*ignored_files)
      end
    end

    def ignored_files
      YAML.load_file(File.join(@sourcepath, CONFIG_FILE))[CONFIG_IGNORE_KEY]
    end
  end
end
