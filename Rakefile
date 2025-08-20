require "erb"
require "fileutils"

desc "install sot's files to user's home directory"
task :install do
  # install from project root into $HOME as dotfiles
  ctx = { replace_all: false }
  install_group(
    source_dir: ".",
    target_dir_path: ENV['HOME'],
    dot_prefix: true,
    ignore_names: ["Rakefile", "README.md", "bin", "config"],
    ctx: ctx
  )

  # install items under config/ into $HOME/.config
  if Dir.exist?("config")
    install_group(
      source_dir: "config",
      target_dir_path: File.join(ENV['HOME'], ".config"),
      dot_prefix: false,
      ignore_names: [],
      ctx: ctx
    )
  end
end

def install_group(source_dir:, target_dir_path:, dot_prefix:, ignore_names: [], ctx:)
  entries = Dir.glob(File.join(source_dir, "*"))
             .map { |path| File.basename(path) }
             .reject { |name| ignore_names.any? { |p| p.is_a?(Regexp) ? p.match?(name) : /\A#{Regexp.escape(p.to_s)}\z/.match?(name) } }

  entries.each do |entry|
    source_path = File.join(source_dir, entry)
    target_name = entry.sub(/\.erb$/, '')
    target_name = ".#{target_name}" if dot_prefix
    target_path = File.join(target_dir_path, target_name)
    install_one(source_path, target_path, ctx)
  end
end

def install_one(source_path, target_path, ctx)
  if File.exist?(target_path)
    if File.identical?(source_path, target_path)
      puts "identical #{target_path}"
    elsif ctx[:replace_all]
      replace_target(source_path, target_path)
    else
      print "overwrite #{target_path}? [ynaq] "
      case $stdin.gets&.chomp
      when 'a'
        ctx[:replace_all] = true
        replace_target(source_path, target_path)
      when 'y'
        replace_target(source_path, target_path)
      when 'q'
        exit
      else
        puts "skipping #{target_path}"
      end
    end
  else
    create_link_or_generate(source_path, target_path)
  end
end

def replace_target(source_path, target_path)
  system %Q{rm -rf "#{target_path}"}
  create_link_or_generate(source_path, target_path)
end

def create_link_or_generate(source_path, target_path)
  FileUtils.mkdir_p(File.dirname(target_path))
  if source_path =~ /\.erb$/
    puts "generating #{target_path}"
    File.open(target_path, 'w') do |new_file|
      new_file.write ERB.new(File.read(source_path)).result(binding)
    end
  else
    puts "linking #{target_path}"
    system %Q{ln -s "$PWD/#{source_path}" "#{target_path}"}
  end
end