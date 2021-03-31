import React from 'react'
import ReactDOM from 'react-dom'
// react-router-dom から import
import { BrowserRouter } from 'react-router-dom';
import App from '../components/App'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    // BrowserRouterで囲われているAppコンポーネントでは、react-router-dom のスイッチやリンクが使える
    <BrowserRouter>
      <App/>
    </BrowserRouter>,
    // idがrootの要素を取得し,その中にAppコンポーネントを描画している
    document.querySelector('#root'),
  );
});