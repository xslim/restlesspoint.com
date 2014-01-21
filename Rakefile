require 'rubygems'
require 'rake'
require 'rdoc'
require 'date'
require 'yaml'
require 'tmpdir'
require 'jekyll'


desc "Serve"
task :serv do
  system "jekyll serve --watch"
end

desc "Generate blog files"
task :generate do
  Dir.glob("*/_posts/**/*.md").each do |entry|
    if (File.basename(entry) =~ /^\d{4}-\d{2}-\d{2}-/).nil?
      path = File.dirname(entry)
      now = Date.today.strftime("%Y-%m-%d")
      puts "Renaming #{entry} to #{now}-#{File.basename(entry)}"
      File.rename(entry, "#{path}/#{now}-#{File.basename(entry)}") 
    end
  end
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

# Usage: rake drafts
desc "Build Jekyll site with _drafts posts"
task :drafts do
  system "jekyll build --drafts --limit_posts 10"
end # task :drafts


desc "Push to gh-pages"
task :push do
  Dir.mktmpdir do |tmp|
    system "mv _site/* #{tmp}"
    system "cp CNAME #{tmp}"
    system "git checkout gh-pages"
    system "rm -rf *"
    system "mv #{tmp}/* ."
    message = "Site updated at #{Time.now.utc}"
    system "git add ."
    system "git commit -am #{message.shellescape}"
    system "git push origin gh-pages --force"
    system "git checkout master"
  end
end

# Ping Pingomatic
desc 'Ping pingomatic'
task :pingomatic do
  begin
    require 'xmlrpc/client'
    puts '* Pinging ping-o-matic'
    XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing', 'restlesspoint.com' , 'http://restlesspoint.com', 'http://restlesspoint.com/atom.xml')
  rescue LoadError
    puts '! Could not ping ping-o-matic, because XMLRPC::Client could not be found.'
  end
end

# Ping Google
desc 'Notify Google of the new sitemap'
task :sitemapgoogle do
  begin
    require 'net/http'
    require 'uri'
    puts '* Pinging Google about our sitemap'
    Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + URI.escape('http://restlesspoint.com/sitemap.xml'))
  rescue LoadError
    puts '! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found.'
  end
end

# Ping Bing
desc 'Notify Bing of the new sitemap'
task :sitemapbing do
  begin
    require 'net/http'
    require 'uri'
    puts '* Pinging Bing about our sitemap'
    Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + URI.escape('http://restlesspoint.com/sitemap.xml'))
  rescue LoadError
    puts '! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found.'
  end
end

# rake notify
desc 'Notify various services about new content'
task :notify => [:pingomatic, :sitemapgoogle, :sitemapbing] do
end

task :default => :generate