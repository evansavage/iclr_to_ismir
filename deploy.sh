TEMP_DEPLOY_BRANCH=temp-gh-pages

python3 main.py sitedata/ --build
git branch -D gh-pages
git branch -D $TEMP_DEPLOY_BRANCH
git checkout -b $TEMP_DEPLOY_BRANCH
git add -f build
git commit -am "Deploy on gh-pages"
git subtree split --prefix build -b gh-pages
	# git push --force "https://${GH_TOKEN}@${GH_REF}.git" $(TEMP_DEPLOY_BRANCH):gh-pages
git push --force origin gh-pages
git checkout @{-1}
echo "Deployed to gh-pages 🚀"
