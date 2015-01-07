require "fileutils.rb"

noop=false
if ARGV[0] == "--noop"
    noop=true
end

Dir.glob(File.join("..", "**", "*.*")) { |x|
    if x != x.downcase
        puts "Moving #{x} to #{x.downcase}"
        if not noop
            puts "Executing command: git mv -f \"#{x}\" \"#{x.downcase}\""
            if not system "git mv -f \"#{x}\" \"#{x.downcase}\""
                puts "Command Failed: $?"
                puts "Exiting..."
                exit 1
            end
        end
    end
}

