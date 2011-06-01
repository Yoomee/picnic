run "cd #{current_path} && rake ts:stop RAILS_ENV=#{environment} -t"
run "rm -rf #{release_path}/public/uploads"
(2010..Time.now.year).each do |year|
  release_year_path = "#{release_path}/public/dragonfly/#{year}"
  shared_year_path = "#{shared_path}/dragonfly/#{year}"
  run "rm -rf #{release_year_path}" if File.exists?(release_year_path)
  run "mkdir -p #{shared_year_path}" unless File.exists?(shared_year_path)
  run "ln -nfs #{shared_year_path} #{release_year_path}"
end
run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"

run "mkdir -p #{release_path}/uploads"
(2010..Time.now.year).each do |year|
  release_year_path = "#{release_path}/uploads/#{year}"
  shared_year_path = "#{shared_path}/doc_uploads/#{year}"
  run "rm -rf #{release_year_path}" if File.exists?(release_year_path)
  run "mkdir -p #{shared_year_path}" unless File.exists?(shared_year_path)
  run "ln -nfs #{shared_year_path} #{release_year_path}"
end

run "ln -nfs #{release_path}/client/public/index.html #{release_path}/public/index.html"
run "ln -nfs #{release_path}/client/public/_css #{release_path}/public/_css"
run "ln -nfs #{release_path}/client/public/_gfx #{release_path}/public/_gfx"
run "ln -nfs #{release_path}/client/public/_images #{release_path}/public/_images"
run "ln -nfs #{release_path}/client/public/_js #{release_path}/public/_js"

run "rm #{release_path}/public/404.html; ln -nfs #{release_path}/client/public/404.html #{release_path}/public/404.html"
run "rm #{release_path}/public/500.html; ln -nfs #{release_path}/client/public/500.html #{release_path}/public/500.html"

