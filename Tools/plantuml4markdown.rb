
class PlantUML4Markdown
  def self.traverse(path, exts = ['md'], depth = 0)
    entries = Dir::entries(path)
    entries.select do |file|
      ext = file.sub(/.*\./, '')
      exts.include?(ext)
    end.each do |file|
      self.new("#{path}/#{file}", depth).generate
    end
    entries.delete_if do |file|
      file.start_with?('.')
    end.select do |file|
      p = "#{path}/#{file}"
      File.directory?(p)
    end.each do |file|
      self.traverse "#{path}/#{file}", exts, depth + 1
    end
  end

  def initialize(path, depth)
    @path     = path
    @dirname  = File.dirname path
    @basename = (File.basename path).sub(/\..+?$/, '')
    @depth    = depth
    @relative = '../' * @depth
  end

  def generate
    uml       = {}
    uml_count = 1
    converted = []
    
    open @path, 'r' do |f|
      while line = f.gets
        line.chomp!
        if line.start_with?('@startuml') then
          converted << "![Fig. #{uml_count}](#{@basename}-#{uml_count}.svg)"
          u = [line]
          u << 'skinparam classAttributeIconSize 0'
          while uml_line = f.gets
            u << uml_line
            break if uml_line.start_with?('@enduml')
          end
          uml[uml_count] = u
          uml_count += 1
        else
          converted << line
        end
      end
    end

    open @path, 'w' do |f|
      f.puts converted.join("\n")
    end

    open "#{@dirname}/#{@basename}.html", 'w' do |f|
      f.puts <<"HTML"
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<title>#{@basename}</title>
</head>
<body>
<xmp theme="readable" style="display:none;">
#{converted.join("\n")}
</xmp>

<script src="#{@relative}strapdown/strapdown.js"></script>
</body>
</html>
HTML
    end

    uml.each_pair do |index, body|
      open "#{@dirname}/#{@basename}-#{index}.plantuml", "w" do |f|
        f.puts body.join("\n")
      end
    end
  end
end

if ARGV.size > 0 then
  PlantUML4Markdown.traverse(ARGV[0])
else
  puts "plantuml4markdown.rb [path]"
end
