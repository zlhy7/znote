echo 生成静态文件
npm run docs:build
echo 进入生成的文件夹
cd docs/.vuepress/dist/
echo 初始化打包仓库
git init
echo 添加所有文件版本控制
git add -A
echo 提交到本地仓库
git commit -m 'deploy'
echo 推送至远端
git push -f git@gitee.com:zlhy7/znote.git master:gh-pages
