
class PlantUML4Markdown
  def self.traverse(path, exts = ['md'])
    entries = Dir::entries(path)
    entries.select do |file|
      ext = file.sub(/.*\./, '')
      exts.include?(ext)
    end.each do |file|
      self.new("#{path}/#{file}").generate
    end
    entries.delete_if do |file|
      file.start_with?('.')
    end.select do |file|
      p = "#{path}/#{file}"
      File.directory?(p)
    end.each do |file|
      self.traverse "#{path}/#{file}", exts
    end
  end

  def initialize(path)
    @path = path
  end

  def generate
    
  end
end

if ARGV.size > 0 then
  PlantUML4Markdown.traverse(ARGV[0])
else
  puts "plantuml4markdown.rb [path]"
end
