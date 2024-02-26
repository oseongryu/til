## 

npx create-next-app nextjs --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/learn-starter"

cd nextjs-blog
npm run dev

npx create-next-app nextjs-blog --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/navigate-between-pages-starter"

### bash
lsof -i tcp:3000
kill -9 PID

npx create-next-app nextjs-blog --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/assets-metadata-css-starter"


npx create-next-app nextjs-blog --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/data-fetching-starter"


npx create-next-app nextjs-blog --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/dynamic-routes-starter"

npx create-next-app nextjs-blog --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/api-routes-starter"

npx create-next-app nextjs-blog --use-npm --example "https://github.com/vercel/next-learn-starter/tree/master/basics-final"

npx create-next-app next-js
npm run dev


https://react.semantic-ui.com/usage

npm install semantic-ui-react semantic-ui-css
import 'semantic-ui-css/semantic.min.css'

autoimport
(https://marketplace.visualstudio.com/items?itemName=NuclleaR.vscode-extension-auto-import)

gnb
  <Menu inverted>
    <Menu.Item
      name='home'
      active={activeItem === 'home'}
      onClick={this.handleItemClick}
    />
    <Menu.Item
      name='messages'
      active={activeItem === 'messages'}
      onClick={this.handleItemClick}
    />
    <Menu.Item
      name='friends'
      active={activeItem === 'friends'}
      onClick={this.handleItemClick}
    />
  </Menu>

docu
https://nextjs.org/docs/advanced-features/custom-document

[2]

http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline

npm install axios


dynamic routes

https://nextjs.org/docs/routing/dynamic-routes

import { useRouter } from 'next/router'

const Post = () => {
  const router = useRouter()
  const { pid } = router.query

  return <p>Post: {id}</p>
}

export default Post

## next/link


## nextjs deploy

git clone
cd next-web
npm install
npm run build
pm2 list
pm2 stop 0
pm2 delete 0

pm2 start server.js

## nextjs  
pm2 start npm --name 'myserver' -- start -p 3000


## 문자열 끝 공백
http://mwultong.blogspot.com/2007/02/cr-lf-enter-key-match-regex.html