# frontend(Nuxt.js)

## create app
    nvm use 16.17.1

    yarn create nuxt-app nuxt-prac
    ---
    Project name: nuxt-prac
    Programming language: TypeScript
    Package manager: Yarn
    UI framework: None
    Template engine: HTML
    Nuxt.js modules: Axios
    Linting tools: ESLint, Prettier
    Testing framework: None
    Rendering mode: Single Page App
    Deployment target: Static(Static/Jamstack hosting)
    Development tools: jsconfig.json
    Continuos integration: None
    Version Control System: Git
    ---

## project setting

### prettier 설정
    .prettierrc
### vscode code-workspace 추가
    VSCode > File > Save Workspace As...
### nuxt-property-decorator
    yarn add nuxt-property-decorator

### jest
    npm i -D ts-jest @types/jest
    yarn add ts-jest @types/jest --dev

jest.config.ts
---
module.exports = {
  moduleFileExtensions: ['ts'],
  testRegex: '(test|spec)\\.(jsx?|tsx?)$',
  transform: {
    '^.+\\tsx?$': 'ts-jest',
  },
}
---

tsconfig.json
---
{
  "compilerOptions": {
    "types": ["@nuxt/types", "@nuxtjs/axios", "@types/node", "@types/jest"]
  },
}
---

### references
https://nuxtjs.org/docs/get-started/conclusion



# backend(SpringBoot)
