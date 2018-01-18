require 'thor'
require 'yaml'
require 'csv'

require 'qa_at_migration/test_file'
require 'qa_at_migration/generator'

module QaAtMigration
  class ThorCommands < Thor
    option :sourcepath, :aliases => "-s", :required => false, :banner => '</path/to/project>, current path if no sourcepath is provided'
    option :targetpath, :aliases => "-t", :required => false, :banner => '</path/to/generate>, current path if no targetpath is provided'
    desc "generate_csv [<OUTPUT_FILENAME>.csv]", 
    "The default value will be 'master.csv' if no OUTPUT_FILENAME is provided"
    long_desc <<-LONGDESC
    The default value will be 'master.csv' if no OUTPUT_FILENAME is provided.\n
    This tool will look for all the *.md files that are inside </path/to/project> and convert each of them
    into its csv representation and then stored into a single file called <OUTPUT_FILENAME>.csv inside 
    the </path/to/generate/> provided.
    LONGDESC
    def generate_csv *output_filename
      output_filename = output_filename.length > 0 ? "#{output_filename[0]}.csv" : nil
      if output_filename
        Generator.new.generate options[:sourcepath], options[:targetpath], output_filename
      else
        Generator.new.generate options[:sourcepath], options[:targetpath]
      end
    end
  end
end
