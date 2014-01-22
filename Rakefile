require 'rubygems'
require "bundler/setup"
require 'rake'
require 'rdoc'
require 'date'
require 'yaml'
require 'tmpdir'
require 'jekyll'

config[:destination] ||= '_site/'
config[:sub_content] ||= []
destination = File.join config[:destination], '/'

def stage_clean?
  system('git', 'diff', '--staged', '--exit-code')
end

def working_directory_clean?
  system('git', 'diff', '--exit-code')
end

def can_switch_branch?
  return true if working_directory_clean? && stage_clean?

  puts "Aborting: Deploying requires a clean working directory and staging area."
  puts "  - Commit changes to add them to the compile output."
  puts "  - `git stash` changes to omit them from compile output."
  false
end

desc "Serve"
task :serv do
  system "jekyll serve --watch"
end

# Usage: rake drafts
desc "Build Jekyll site with _drafts posts"
task :drafts do
  system "jekyll build --drafts --limit_posts 10"
end # task :drafts

# rake build
desc 'Generate the site'
task :build do
  
  Dir.glob("*/_posts/**/*.md").each do |entry|
    if (File.basename(entry) =~ /^\d{4}-\d{2}-\d{2}-/).nil?
      path = File.dirname(entry)
      now = Date.today.strftime("%Y-%m-%d")
      puts "Renaming #{entry} to #{now}-#{File.basename(entry)}"
      File.rename(entry, "#{path}/#{now}-#{File.basename(entry)}") 
    end
  end
  
  system 'bundle', 'exec', 'jekyll', 'build'

  config[:sub_content].each do |content|
    repo = content[0]
    branch = content[1]
    dir = content[2]
    rev = content[3]
    Dir.chdir config[:destination] do
      FileUtils.mkdir_p dir
      system "git clone -b #{branch} #{repo} #{dir}"
      Dir.chdir dir do
        system "git checkout #{rev}" if rev
        FileUtils.remove_entry_secure '.git'
        FileUtils.remove_entry_secure '.nojekyll' if File.exists? '.nojekyll'
      end if dir
    end if Dir.exists? config[:destination]
  end
end


desc 'Generate site and publish to GitHub Pages.'
task :ghpages do
  repo = %x(git config remote.origin.url).strip
  deploy_branch = repo.match(/github\.io\.git$/) ? 'master' : 'gh-pages'
  rev = %x(git rev-parse HEAD).strip

  system 'bundle update'
  system 'bower update'

  Dir.mktmpdir do |dir|
    system "git clone --branch #{deploy_branch} #{repo.strip} #{dir}"
    system 'bundle exec rake build'
    system %Q(rsync -rt --delete-after --exclude=".git" --exclude=".nojekyll" #{destination} #{dir})
    Dir.chdir dir do
      system 'git add --all'
      system "git commit -m 'Built from #{rev}'"
      system 'git push'
    end
  end
end

desc 'Generate site from Travis CI and publish site to GitHub Pages.'
task :travis do
  # if this is a pull request, do a simple build of the site and stop
  if ENV['TRAVIS_PULL_REQUEST'].to_s.to_i > 0
    puts 'Pull request detected. Executing build only.'
    system 'bundle exec rake build'
    next
  end

  # setup credentials so Travis CI can push to GitHub
  system "git config user.name '#{ENV['GIT_NAME']}'"
  system "git config user.email '#{ENV['GIT_EMAIL']}'"

  repo = %x(git config remote.origin.url).gsub(/^git:/, 'https:').strip
  deploy_url = repo.gsub %r{https://}, "https://#{ENV['GH_TOKEN']}@"
  deploy_branch = repo.match(/github\.io\.git$/) ? 'master' : 'gh-pages'
  rev = %x(git rev-parse HEAD).strip

  system "git remote add deploy #{repo}"
  system "git remote set-branches deploy #{deploy_branch}"
  system 'git fetch -q deploy'
  system "git branch #{deploy_branch} deploy/#{deploy_branch}"
  system 'bundle exec rake build'

  fail "Build failed." unless Dir.exists? destination

  system "git checkout #{deploy_branch}"
  system %Q(rsync -rt --delete-after --exclude=".git" --exclude=".nojekyll" #{destination} .)
  system 'git add --all'
  system "git commit -m 'Built from #{rev}'"
  system "git push -q #{deploy_url} #{deploy_branch}"
end

desc "Deploy to gh-pages"
task :deploy do
  return false unless can_switch_branch?
  
  Dir.mktmpdir do |tmp|
    system "mv _site/* #{tmp}"
    system "cp CNAME #{tmp}"
    system "git checkout gh-pages"
    system "rm -rf *"
    system "mv #{tmp}/* ."
    message = "Site updated at #{Time.now.utc}"
    system "git add --all"
    system "git commit -am #{message.shellescape}"
    system "git push origin gh-pages --force --quiet"
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

task :default => :build