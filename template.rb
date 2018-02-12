RAILS_REQUIREMENT = "~> 5.1.0".freeze

def apply_template!
  assert_minimum_rails_version
  assert_valid_options
  assert_postgresql
  add_template_repository_to_source_path

  template "Gemfile.tt", :force => true


  template "README.md.tt", :force => true
  remove_file "README.rdoc"

  copy_file "gitignore", ".gitignore", :force => true
  template "ruby-version.tt", ".ruby-version"

  copy_file "Procfile"

  # apply "app/template.rb"
  apply "bin/template.rb"
  # apply "config/template.rb"
  # apply "doc/template.rb"
  # apply "lib/template.rb"
  # apply "test/template.rb"
  #
  #

  #
  run_with_clean_bundler_env "bin/setup"

end

require "fileutils"
require "shellwords"

# Add this template directory to source_paths so that Thor actions like
# copy_file and template resolve against our source files. If this file was
# invoked remotely via HTTP, that means the files are not present locally.
# In that case, use `git clone` to download them to a local temporary dir.
def add_template_repository_to_source_path
  p "111111111111111111111"
  p "111111111111111111111"
  p "111111111111111111111"
  p "111111111111111111111"
  p "Murugaa saranam................"
  p "Murugaa saranam................"
  p "Murugaa saranam................"
  if __FILE__ =~ %r{\Ahttps?://}
    p "Murugaaaaaaaaaaaaaaaaaaa"
    p "666666"
    p "666666"
    p "666666"
    p "666666"
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("rails-template-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git :clone => [
      "--quiet",
      # "https://github.com/mattbrictson/rails-template.git",
      "https://github.com/Mashey/mashey.com.git",
      tempdir
    ].map(&:shellescape).join(" ")

    if (branch = __FILE__[%r{rails-template/(.+)/template.rb}, 1])
      Dir.chdir(tempdir) { git :checkout => branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def assert_minimum_rails_version
  requirement = Gem::Requirement.new(RAILS_REQUIREMENT)
  rails_version = Gem::Version.new(Rails::VERSION::STRING)
  return if requirement.satisfied_by?(rails_version)

  prompt = "This template requires Rails #{RAILS_REQUIREMENT}. "\
           "You are using #{rails_version}. Continue anyway?"
  exit 1 if no?(prompt)
end

# Bail out if user has passed in contradictory generator options.
def assert_valid_options
  valid_options = {
    :skip_gemfile => false,
    :skip_bundle => false,
    :skip_git => false,
    :skip_test_unit => false,
    :edge => false
  }
  valid_options.each do |key, expected|
    next unless options.key?(key)
    actual = options[key]
    unless actual == expected
      fail Rails::Generators::Error, "Unsupported option: #{key}=#{actual}"
    end
  end
end

def assert_postgresql
  return if IO.read("Gemfile") =~ /^\s*gem ['"]pg['"]/
  fail Rails::Generators::Error,
       "This template requires PostgreSQL, "\
       "but the pg gem isn’t present in your Gemfile."
end

def gemfile_requirement(name)
  @original_gemfile ||= IO.read("Gemfile")
  req = @original_gemfile[/gem\s+['"]#{name}['"]\s*(,[><~= \t\d\.\w'"]*)?.*$/, 1]
  req && req.gsub("'", %(")).strip.sub(/^,\s*"/, ', "')
end

def ask_with_default(question, color, default)
  return default unless $stdin.tty?
  question = (question.split("?") << " [#{default}]?").join
  answer = ask(question, color)
  answer.to_s.strip.empty? ? default : answer
end

def preexisting_git_repo?
  @preexisting_git_repo ||= (File.exist?(".git") || :nope)
  @preexisting_git_repo == true
end


def run_with_clean_bundler_env(cmd)
  return run(cmd) unless defined?(Bundler)
  Bundler.with_clean_env { run(cmd) }
end

apply_template!