# encoding: utf-8

# blatantly copied from Thor :)
def ask(statement, color=nil)
  $stdout.print("#{statement} ")
  $stdin.gets.strip
end

desc 'Add a new hometown'
task :new do
  new_hometown = ask("What's your hometown?")
  filename = "#{Time.now.strftime('%Y-%m-%d')}-#{new_hometown.downcase}.html"
  File.open(File.expand_path("../_posts/#{filename}", __FILE__), 'w') do |file|
    file.write <<-EOS
---
layout: hometown
title: #{new_hometown}
---

<div class="image_with_caption">
  <img src="/images/skyline.jpg" width="500" height="129" />
  <p class="caption">#{new_hometown} is objectively superior to the place you grew up.</p>
  <p class="attribution">
    <a href="http://www.flickr.com/photos/ashley3d/6921543223/">Robert Ashley, CC-BY-SA</a>
  </p>
</div>
EOS
  puts "Created _posts/#{filename} with a basic template. Have fun!"
  end
end