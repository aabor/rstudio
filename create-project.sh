# Create a new repository on GitHub. To avoid
# errors, do not initialize the new repository
# with README, license, or gitignore files. You
# can add these files after your project has been
# pushed to GitHub.
cd r-projects
mkdir rstudio-finance
cd rstudio-finance
git init 
git add LICENSE
#echo "# rstudio-finace" >> README.md
git add README.md
git commit -m "License and desciption"
git add Dockerfile
git add docker-compose.yml
git commit -m "Docker configuration"
git add create-project.sh
git commit -m "project shell script"
git status
# At the top of your GitHub repository's Quick
# Setup page, click to copy the remote repository
# URL. 
git remote add origin git@github.com:aabor/rstudio-finance.git
# git@github.com:aabor/rstudio-text.git
# # switch from HTTPS to SSH (no need to Enter password every push)
# git remote set-url origin git@github.com:aabor/rstudio-finace.git
git remote -v
git push -u origin master
# Create an automated build on docker hub

# configure image on docker hub
docker-compose build
docker-compose up -d
docker push aabor/rstudio-finance

touch .gitignore
git add .gitignore
git commit -m "message" .gitignore
git status
echo ".rstudio/" >> .gitignore
echo ".Rhistory" >> .gitignore
nano .gitignore

