# run after pull to symlink files into your home directory
# Borrowed from @thegreatape, who borrowed it from @throughnothing, # who...OSSFTW

require 'fileutils'
files = Dir['*'].reject{|f| f =~ /README|install/ }

home = File.expand_path('~/')

files = files.map {|file| File.join(File.dirname(File.expand_path(__FILE__)), file) }

files.each do |from|
  next unless File.file?(from)

  to = "#{home}/.#{File.basename(from)}"


  puts "- " + [from, to].join(" => ")
  if File.symlink?(to)
    FileUtils.rm(to)
    puts "Target exists as a symlink... removed"
  elsif File.exists?(to)
    puts "Target exists as a file...    moving to #{to}~"
    toto = to + "~"

    if File.exists?(toto)
      print "already exists! r)emove or s)kip? "
      order = STDIN.gets.chomp

      case order
      when 'r'
        puts "Removing..."
        FileUtils.rm(toto)
      when 's'
        puts "Skipping..."
        next
      else
        puts "Invalid...skipping"
        next
      end
    end

    FileUtils.mv(to, toto)
    puts "Done!"
  end
  FileUtils.symlink(from, to)
end
