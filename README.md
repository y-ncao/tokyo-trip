# Tokyo Trip 页面 · GitHub Pages 发布说明

这个文件夹是一个**独立的、只含东京行程这一个页面**的静态网站,可直接发布到 GitHub Pages。

## 文件夹内容

- `index.html` — 整篇行程(第 1–8 节)渲染好的网页,中日文 + 表格 + 图片都在里面。
- `assets/` — 所有本地图片(food / googlemaps / recommendations),约 51MB。
- `.nojekyll` — 让 GitHub 跳过 Jekyll 处理,直接按静态文件托管。
- 行程里景点的少量图来自 Wikimedia 在线链接(联网显示);其余都是本地图。

## 发布到 GitHub Pages(公开 URL)

> 注意:免费版 GitHub Pages 的页面是**公开**的——任何拿到 URL 的人都能打开,无法做成登录才能看。这个仓库里**只放了这一个页面+图片**,不会暴露你其它文件。

1. 在 https://github.com 登录后,点右上角 `+` → `New repository`,起名比如 `tokyo-trip`,选 Public,创建(不要勾 Add README,避免冲突)。
2. 把本文件夹里的 **全部内容**(`index.html`、`assets/`、`.nojekyll`)上传到仓库:
   - 简单方式:仓库页面点 `Add file` → `Upload files`,把这些拖进去 commit。(`assets` 文件夹整体拖入即可。)
   - 或用 git 命令:
     ```bash
     cd tokyo-trip-site
     git init && git add . && git commit -m "tokyo trip page"
     git branch -M main
     git remote add origin https://github.com/<你的用户名>/tokyo-trip.git
     git push -u origin main
     ```
3. 仓库 `Settings` → 左侧 `Pages` → `Build and deployment` → Source 选 `Deploy from a branch` → Branch 选 `main` / `/ (root)` → `Save`。
4. 等约 1 分钟,页面就上线在:
   `https://<你的用户名>.github.io/tokyo-trip/`

## 如果你想要"私有 / 登录才能看"

GitHub Pages 免费版做不到访问控制。可行的替代:

- **保持仓库 private、不开 Pages**:你可以本地直接双击 `index.html` 打开看;团队成员有仓库权限就能 clone 后本地看。
- **带密码的托管**:如 Cloudflare Pages / Netlify 的密码保护(部分为付费功能),或 GitHub Enterprise 的 Pages access control(付费)。
- 需要的话我可以帮你按其中一种方案重新出配置。

## 更新页面

行程 Markdown 以后有改动,重新生成 `index.html` 覆盖即可(图片有新增时把对应文件放进 `assets/`)。
